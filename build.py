#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import hashlib
import json
import os
import tarfile
import glob


PARENT_PATH = os.path.dirname(os.path.realpath(__file__))
CONF_PATH = os.path.join(PARENT_PATH, "config.json.js")


def md5sum(full_path):
    with open(full_path, "rb") as rf:
        return hashlib.md5(rf.read()).hexdigest()


def build_module():
    with open(CONF_PATH, "r", encoding="utf-8") as fc:
        conf = json.load(fc)

    module = conf["module"]
    version = conf["version"]
    module_path = os.path.join(PARENT_PATH, module)
    install_path = os.path.join(module_path, "install.sh")
    if not os.path.isdir(module_path):
        raise RuntimeError("not found %s dir" % module_path)
    if not os.path.isfile(install_path):
        raise RuntimeError("not found %s file" % install_path)

    with open(os.path.join(module_path, "version"), "w", encoding="utf-8") as fw:
        fw.write(version)

    pkg_prefix = conf.get("title", module).replace(" ", "")
    pkg_name = "%s_v%s.tar.gz" % (pkg_prefix, version)
    pkg_path = os.path.join(PARENT_PATH, pkg_name)
    for name in ("%s.tar.gz" % module, "%s_%s.tar.gz" % (module, version), pkg_name):
        old_pkg = os.path.join(PARENT_PATH, name)
        if os.path.exists(old_pkg):
            os.remove(old_pkg)
    for old_pkg in glob.glob(os.path.join(PARENT_PATH, "%s_v*.tar.gz" % pkg_prefix)):
        if os.path.basename(old_pkg) != pkg_name:
            os.remove(old_pkg)

    def tar_filter(info):
        if os.path.basename(info.name) == ".DS_Store":
            return None
        return info

    with tarfile.open(pkg_path, "w:gz") as tar:
        tar.add(module_path, arcname=module, filter=tar_filter)

    conf["md5"] = md5sum(pkg_path)
    with open(CONF_PATH, "w", encoding="utf-8") as fw:
        json.dump(conf, fw, sort_keys=True, indent=4, ensure_ascii=False)

    print("build done %s" % pkg_name)


if __name__ == "__main__":
    build_module()
