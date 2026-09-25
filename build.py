#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import hashlib
import json
import os
import shutil
import tarfile
import tempfile
import glob


PARENT_PATH = os.path.dirname(os.path.realpath(__file__))
CONF_PATH = os.path.join(PARENT_PATH, "config.json.js")


def md5sum(full_path):
    with open(full_path, "rb") as rf:
        return hashlib.md5(rf.read()).hexdigest()


def normalize_line_endings(module_dir):
    """路由器端脚本必须为 LF 换行。

    新版软件中心用 start-stop-daemon -x 直接执行 install.sh，脚本走内核 shebang。
    若为 CRLF，shebang 会变成 "#!/bin/sh\r"，安装时报
    "start-stop-daemon: Unable to start .../install.sh: No such file or directory"。
    """
    for root, _dirs, files in os.walk(module_dir):
        for name in files:
            if not name.endswith(".sh"):
                continue
            path = os.path.join(root, name)
            with open(path, "rb") as rf:
                data = rf.read()
            fixed = data.replace(b"\r\n", b"\n")
            if fixed != data:
                with open(path, "wb") as wf:
                    wf.write(fixed)
                print("warning: %s is CRLF, normalized to LF for the package" % os.path.relpath(path, os.path.dirname(module_dir)))


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
    for name in (pkg_name, "%s.tar.gz" % module, "%s_v%s.tar.gz" % (module, version)):
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

    with tempfile.TemporaryDirectory() as staging:
        staged_module = os.path.join(staging, module)
        shutil.copytree(module_path, staged_module)
        normalize_line_endings(staged_module)
        with tarfile.open(pkg_path, "w:gz") as tar:
            tar.add(staged_module, arcname=module, filter=tar_filter)

    conf["md5"] = md5sum(pkg_path)
    with open(CONF_PATH, "w", encoding="utf-8") as fw:
        json.dump(conf, fw, sort_keys=True, indent=4, ensure_ascii=False)

    print("build done %s" % pkg_name)


if __name__ == "__main__":
    build_module()
