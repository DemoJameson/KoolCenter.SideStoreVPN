<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="-1" />
<link rel="shortcut icon" href="/res/icon-sidestorevpn.png" />
<link rel="icon" href="/res/icon-sidestorevpn.png" />
<title>软件中心 - SideStoreVPN</title>
<link rel="stylesheet" type="text/css" href="index_style.css">
<link rel="stylesheet" type="text/css" href="form_style.css">
<link rel="stylesheet" type="text/css" href="usp_style.css">
<link rel="stylesheet" type="text/css" href="css/element.css">
<link rel="stylesheet" type="text/css" href="/device-map/device-map.css">
<link rel="stylesheet" type="text/css" href="/js/table/table.css">
<link rel="stylesheet" type="text/css" href="/res/layer/theme/default/layer.css">
<link rel="stylesheet" type="text/css" href="/res/softcenter.css">
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/httpApi.js"></script>
<script type="text/javascript" src="/state.js"></script>
<script type="text/javascript" src="/popup.js"></script>
<script type="text/javascript" src="/help.js"></script>
<script type="text/javascript" src="/general.js"></script>
<script type="text/javascript" src="/client_function.js"></script>
<script type="text/javascript" language="JavaScript" src="/js/table/table.js"></script>
<script type="text/javascript" src="/res/softcenter.js"></script>
<script type="text/javascript" src="/switcherplugin/jquery.iphone-switch.js"></script>
<script type="text/javascript" src="/validator.js"></script>
<style>
a:focus{outline:none}
.SimpleNote{padding:5px 5px}
i{color:#FC0;font-style:normal}
.loadingBarBlock{width:740px}
.popup_bar_bg_ks{position:fixed;margin:auto;top:0;left:0;width:100%;height:100%;z-index:201;filter:alpha(opacity=90);background-repeat:repeat;visibility:hidden;overflow:hidden;background:rgba(68,79,83,.85) none repeat scroll 0 0!important;background-position:0 0;background-size:cover;opacity:.94}
.FormTitle em{color:#00ffe4;font-style:normal}
.FormTable th{width:30%}
.formfonttitle{font-family:Roboto-Light,"Microsoft JhengHei";font-size:18px;margin-left:5px}
.FormTitle,.FormTable,.FormTable th,.FormTable td,.FormTable thead td,.FormTable_table,.FormTable_table th,.FormTable_table td,.FormTable_table thead td{font-size:14px;font-family:Roboto-Light,"Microsoft JhengHei"}
.sidestore-note{line-height:1.7;color:#FC0;padding:8px}
.sidestore-table{width:100%;border:none;border-collapse:collapse;background-color:transparent;text-align:center;font-size:12px;table-layout:fixed}
.sidestore-table tr{height:36px}
.sidestore-table td{border-left:none;border-top:none;border-right:none;border-bottom:1px solid #FFF;border-collapse:collapse;font-family:Lucida Console;height:42px;white-space:nowrap;overflow:visible;text-overflow:ellipsis}
.sidestore-table th{font-family:Arial,Helvetica,sans-serif;font-weight:normal;text-align:center;font-size:12px;color:#FFF;height:25px;border-collapse:collapse;border:0;background:#2F3A3E}
.sidestore-input{box-sizing:border-box;width:78%;height:30px;line-height:30px \9;font-size:12px;font-family:Lucida Console;color:#FFF;outline:none;text-align:center;border:1px solid #87979C;background-color:rgba(255,255,255,.05)}
.sidestore-input:hover,.sidestore-input:focus{outline:none;border:1px solid #FFF;background-color:#576D73}
.sidestore-table .sidestore-input{display:block;width:78%!important;margin:0 auto!important;padding:0!important}
.sidestore-name-wrap{position:relative;width:78%!important;margin:0 auto!important;overflow:visible}
.sidestore-name-wrap .sidestore-input{width:100%!important;margin:0!important;padding:0 26px!important}
.sidestore-client-dropdown{position:absolute;left:0;top:32px;z-index:200;min-width:320px;max-height:260px;overflow-y:auto;background:#2f3a3e;border:1px solid #67767d;box-shadow:3px 3px 10px #000;display:none;text-align:left}
.sidestore-client-dropdown div{padding:7px 8px;cursor:pointer;border-bottom:1px solid #475766;color:#FFF;white-space:nowrap;overflow:visible;text-overflow:clip;font-family:Lucida Console;font-size:11px;font-weight:normal}
.sidestore-client-dropdown div:hover{background:#576D73}
.sidestore-client-dropdown strong{font-weight:normal;color:#FFF}
.sidestore-client-dropdown span{color:#FFF!important;background:transparent!important;font-size:11px;margin-left:10px;font-weight:normal}
.sidestore-arrow{display:block;position:absolute;right:6px;top:0;width:24px;height:30px;cursor:pointer;background:transparent!important;border:0!important;box-shadow:none!important;text-shadow:none!important;filter:none!important}
.sidestore-arrow:after{content:"";position:absolute;left:7px;top:12px;width:0;height:0;border-left:5px solid transparent;border-right:5px solid transparent;border-top:7px solid #FFF;box-shadow:none!important;text-shadow:none!important;filter:none!important}
.sidestore-arrow.open:after{top:11px;border-top:0;border-bottom:7px solid #FFF}
.sidestore-add-btn,.sidestore-remove-btn{width:24px;height:24px;border:1px solid #67767d;border-radius:12px;cursor:pointer;background:#2f3a3e;color:#FFF;font-weight:bold;line-height:20px}
.sidestore-add-btn:hover,.sidestore-remove-btn:hover{background:#576D73}
.sidestore-config-raw{display:none}
.sidestore-setting-cell{padding:10px 18px!important}
.sidestore-setting-box{display:block;max-width:420px}
.sidestore-vip-input{display:block;width:160px!important;text-align:center;margin:0 0 8px 0}
.sidestore-setting-warning{display:block;line-height:1.55;color:#FC0;font-size:13px;white-space:normal}
</style>
<script type="text/javascript">
var dbus = {};
var db_sidestorevpn = {};
var count_down;
var refresh_flag = 0;
var sidestoreClientOptions = [];
var params_input = ["sidestorevpn_clients", "sidestorevpn_virtual_ip"];

String.prototype.myReplace = function(f, e){
	var reg = new RegExp(f, "g");
	return this.replace(reg, e);
}

function init(){
	show_menu(menu_hook);
	register_event();
	get_dbus_data();
	check_status();
}

function menu_hook(title, tab){
	tabtitle[tabtitle.length - 1] = new Array("", "SideStoreVPN");
	tablink[tablink.length - 1] = new Array("", "Module_sidestorevpn.asp");
}

function register_event(){
	$(".popup_bar_bg_ks").click(function(){count_down = -1;});
	$(window).resize(function(){
		if($('.popup_bar_bg_ks').css("visibility") == "visible"){
			center_log_panel();
		}
	});
}

function get_dbus_data(){
	$.ajax({
		type: "GET",
		url: "/_api/sidestorevpn_",
		dataType: "json",
		async: false,
		success: function(data){
			dbus = data.result[0] || {};
			conf2obj();
			show_hide_element();
			refresh_sidestore_device_table();
		}
	});
}

function conf2obj(){
	for(var i = 0; i < params_input.length; i++){
		if(dbus[params_input[i]]){
			E(params_input[i]).value = dbus[params_input[i]];
		}
	}
	if(!E("sidestorevpn_virtual_ip").value){
		E("sidestorevpn_virtual_ip").value = "10.7.0.1";
	}
	if(dbus["sidestorevpn_version"]){
		E("sidestorevpn_version").innerHTML = " - " + dbus["sidestorevpn_version"];
	}
}

function show_hide_element(){
	if(dbus["sidestorevpn_enable"] == "1"){
		E("sidestorevpn_apply_1").style.display = "none";
		E("sidestorevpn_apply_2").style.display = "";
		E("sidestorevpn_apply_3").style.display = "";
	}else{
		E("sidestorevpn_apply_1").style.display = "";
		E("sidestorevpn_apply_2").style.display = "none";
		E("sidestorevpn_apply_3").style.display = "none";
	}
}

function htmlEscape(text){
	return String(text || "").replace(/[&<>"']/g, function(c){
		return {"&":"&amp;","<":"&lt;",">":"&gt;","\"":"&quot;","'":"&#39;"}[c];
	});
}

function jsEscape(text){
	return String(text || "").replace(/\\/g, "\\\\").replace(/'/g, "\\'").replace(/\r/g, "").replace(/\n/g, "");
}

function parse_configured_clients(){
	var raw = E("sidestorevpn_clients").value || "";
	var lines = raw.split(/\r?\n/);
	var clients = [];
	var seen = {};
	for(var i = 0; i < lines.length; i++){
		var line = lines[i].replace(/^\s+|\s+$/g, "");
		if(!line || line.charAt(0) == "#") continue;
		var ip = line.split(/\s+/)[0];
		var name = line.replace(ip, "").replace(/^\s+|\s+$/g, "");
		if(!name) name = "未知设备";
		if(ip && !seen[ip]){
			seen[ip] = 1;
			clients.push({ip: ip, name: name});
		}
	}
	return clients;
}

function normalizeConfigLines(lines){
	var seen = {};
	var out = [];
	for(var i = 0; i < lines.length; i++){
		var line = String(lines[i] || "").replace(/^\s+|\s+$/g, "");
		if(!line) continue;
		if(line.charAt(0) == "#"){
			out.push(line);
			continue;
		}
		var ip = line.split(/\s+/)[0];
		if(seen[ip]) continue;
		seen[ip] = 1;
		out.push(line);
	}
	return out.join("\n");
}

function load_clients_from_asuswrt(){
	try{
		if(typeof clientList == "undefined"){
			return false;
		}
		if(clientList.length == 0 && typeof genClientList == "function"){
			genClientList();
		}
		if(!clientList || clientList.length == 0){
			return false;
		}
		var list = [];
		var seen = {};
		for(var i = 0; i < clientList.length; i++){
			var key = clientList[i];
			var client = clientList[key];
			if(!client || !client.ip || client.ip == "offline") continue;
			if(client.isOnline === false || client.isOnline == 0) continue;
			var ip = client.ip;
			if(seen[ip]) continue;
			var name = client.nickName || client.name || "未知设备";
			seen[ip] = 1;
			list.push({ip: ip, name: name});
		}
		sidestoreClientOptions = list;
		return list.length > 0;
	}catch(e){
		sidestoreClientOptions = [];
		return false;
	}
}

function build_sidestore_client_dropdown(){
	var block = E("sidestoreClientList_Block");
	if(!block) return;
	load_clients_from_asuswrt();
	var html = "";
	if(!sidestoreClientOptions.length){
		html = '<div>未发现在线设备，请手动填写。</div>';
	}else{
		for(var i = 0; i < sidestoreClientOptions.length; i++){
			var item = sidestoreClientOptions[i];
			html += '<div onclick="setSidestoreClientIP(\'' + jsEscape(item.ip) + '\', \'' + jsEscape(item.name) + '\');">';
			html += '<strong>' + htmlEscape(item.name || "未知设备") + '</strong>';
			html += '<span>' + htmlEscape(item.ip) + '</span>';
			html += '</div>';
		}
	}
	block.innerHTML = html;
}

function refresh_sidestore_device_table(){
	var holder = E("sidestore_device_table");
	if(!holder) return;
	var clients = parse_configured_clients();
	var code = "";
	code += '<table width="100%" border="0" align="center" cellpadding="4" cellspacing="0" class="FormTable_table sidestore-table" style="margin:-1px 0px 0px 0px;">';
	code += '<colgroup><col width="42%"><col width="38%"><col width="20%"></colgroup>';
	code += '<tr><th width="42%">设备名</th><th width="38%">IP</th><th width="20%">操作</th></tr>';
	for(var i = 0; i < clients.length; i++){
		code += '<tr class="sidestore_device_row">';
		code += '<td><input type="text" class="input_option_2 sidestore-input sidestore-device-name" maxlength="50" value="' + htmlEscape(clients[i].name) + '" /></td>';
		code += '<td><input type="text" class="input_option_2 sidestore-input sidestore-device-ip" maxlength="18" value="' + htmlEscape(clients[i].ip) + '" /></td>';
		code += '<td><input type="button" class="sidestore-remove-btn" onclick="delSidestoreDeviceTr(this)" value="-" title="删除" /></td>';
		code += '</tr>';
	}
	code += '<tr>';
	code += '<td style="overflow:visible">';
	code += '<div class="sidestore-name-wrap">';
	code += '<input type="text" id="sidestorevpn_host_name" class="input_15_table sidestore-input" maxlength="50" autocomplete="off" onClick="hideSidestoreClientsBlock();" placeholder="设备名" />';
	code += '<span id="sidestore_pull_arrow" class="sidestore-arrow" onclick="pullSidestoreLANIPList(this);" title="选择设备"></span>';
	code += '<div id="sidestoreClientList_Block" class="sidestore-client-dropdown"></div>';
	code += '</div>';
	code += '</td>';
	code += '<td><input type="text" maxlength="18" class="input_15_table sidestore-input" id="sidestorevpn_host_ip" autocomplete="off" autocorrect="off" autocapitalize="off" placeholder="IP"></td>';
	code += '<td><input type="button" class="sidestore-add-btn" onclick="addSidestoreDeviceTr()" value="+" title="添加" /></td>';
	code += '</tr>';
	code += '</table>';
	holder.innerHTML = code;
	build_sidestore_client_dropdown();
}

function sync_config_from_device_table(){
	var rows = document.querySelectorAll(".sidestore_device_row");
	var lines = [];
	for(var i = 0; i < rows.length; i++){
		var ipInput = rows[i].querySelector(".sidestore-device-ip");
		var ip = ipInput ? ipInput.value.replace(/^\s+|\s+$/g, "") : "";
		var nameInput = rows[i].querySelector(".sidestore-device-name");
		var name = nameInput ? nameInput.value.replace(/^\s+|\s+$/g, "") : "";
		if(ip){
			lines.push(ip + (name ? " " + name : ""));
		}
	}
	E("sidestorevpn_clients").value = normalizeConfigLines(lines);
}

function validIpv4(ip){
	var p = String(ip || "").split(".");
	if(p.length != 4) return false;
	for(var i = 0; i < 4; i++){
		if(!/^\d+$/.test(p[i])) return false;
		var n = parseInt(p[i], 10);
		if(n < 0 || n > 255) return false;
	}
	return true;
}

function addSidestoreDeviceTr(){
	var ip = E("sidestorevpn_host_ip").value.replace(/^\s+|\s+$/g, "");
	var name = E("sidestorevpn_host_name").value.replace(/^\s+|\s+$/g, "");
	if(!ip){
		alert("IP 不能为空！");
		return false;
	}
	if(!validIpv4(ip)){
		alert("IP 格式不正确！");
		return false;
	}
	if(!name){
		alert("设备名不能为空！");
		return false;
	}
	sync_config_from_device_table();
	var clients = parse_configured_clients();
	for(var i = 0; i < clients.length; i++){
		if(clients[i].ip == ip){
			alert("该 IP 已存在！");
			return false;
		}
	}
	var lines = (E("sidestorevpn_clients").value || "").split(/\r?\n/);
	lines.push(ip + " " + name);
	E("sidestorevpn_clients").value = normalizeConfigLines(lines);
	E("sidestorevpn_host_ip").value = "";
	E("sidestorevpn_host_name").value = "";
	hideSidestoreClientsBlock();
	refresh_sidestore_device_table();
}

function delSidestoreDeviceTr(o){
	var tr = o;
	while(tr && tr.tagName != "TR"){
		tr = tr.parentNode;
	}
	if(tr){
		tr.parentNode.removeChild(tr);
		sync_config_from_device_table();
		refresh_sidestore_device_table();
	}
}

function setSidestoreClientIP(ip, name){
	E("sidestorevpn_host_ip").value = ip;
	E("sidestorevpn_host_name").value = name || "未知设备";
	hideSidestoreClientsBlock();
}

function pullSidestoreLANIPList(obj){
	build_sidestore_client_dropdown();
	var element = E("sidestoreClientList_Block");
	var isMenuopen = element.offsetWidth > 0 || element.offsetHeight > 0;
	if(isMenuopen == 0){
		obj.className = "sidestore-arrow open";
		element.style.display = "block";
	}else{
		hideSidestoreClientsBlock();
	}
}

function hideSidestoreClientsBlock(){
	if(E("sidestore_pull_arrow")) E("sidestore_pull_arrow").className = "sidestore-arrow";
	if(E("sidestoreClientList_Block")) E("sidestoreClientList_Block").style.display = "none";
}

function validate_form(flag){
	sync_config_from_device_table();
	var virtual_ip = E("sidestorevpn_virtual_ip").value.replace(/^\s+|\s+$/g, "");
	if(!validIpv4(virtual_ip)){
		alert("虚拟 iTunes 设备 IP 格式不正确！");
		return false;
	}
	E("sidestorevpn_virtual_ip").value = virtual_ip;
	var lines = (E("sidestorevpn_clients").value || "").split(/\r?\n/);
	var valid_count = 0;
	for(var i = 0; i < lines.length; i++){
		var line = lines[i].replace(/^\s+|\s+$/g, "");
		if(!line || line.charAt(0) == "#") continue;
		var ip = line.split(/\s+/)[0];
		if(!validIpv4(ip)){
			alert("第 " + (i + 1) + " 行 IP 格式不正确：" + ip);
			return false;
		}
		valid_count++;
	}
	if(flag && valid_count < 1){
		alert("请至少添加一个苹果设备。");
		return false;
	}
	return true;
}

function save(flag){
	if(!validate_form(flag)) return;
	sync_config_from_device_table();
	db_sidestorevpn = {};
	db_sidestorevpn["sidestorevpn_enable"] = flag ? String(flag) : "0";
	db_sidestorevpn["sidestorevpn_virtual_ip"] = E("sidestorevpn_virtual_ip").value.replace(/^\s+|\s+$/g, "");
	db_sidestorevpn["sidestorevpn_clients"] = normalizeConfigLines((E("sidestorevpn_clients").value || "").split(/\r?\n/));
	var id = parseInt(Math.random() * 100000000);
	var postData = {"id": id, "method": "sidestorevpn_config.sh", "params": ["web_submit"], "fields": db_sidestorevpn};
	$.ajax({
		type: "POST",
		url: "/_api/",
		data: JSON.stringify(postData),
		dataType: "json",
		success: function(response){
			if(response.result == id){
				get_log();
			}
		}
	});
}

function check_status(){
	var id = parseInt(Math.random() * 100000000);
	var postData = {"id": id, "method": "sidestorevpn_config.sh", "params": ["status"], "fields": ""};
	$.ajax({
		type: "POST",
		url: "/_api/",
		async: true,
		data: JSON.stringify(postData),
		success: function(response){
			E("sidestorevpn_status").innerHTML = response.result;
			setTimeout("check_status();", 10000);
		},
		error: function(){
			E("sidestorevpn_status").innerHTML = "获取运行状态失败";
			setTimeout("check_status();", 5000);
		}
	});
}

function get_log(flag){
	E("ok_button").style.visibility = "hidden";
	showALLoadingBar();
	$.ajax({
		url: "/_temp/sidestorevpn_log.txt",
		type: "GET",
		cache: false,
		dataType: "text",
		success: function(response){
			var retArea = E("log_content");
			if(response.search("XU6J03M16") != -1){
				retArea.value = response.myReplace("XU6J03M16", " ");
				E("ok_button").style.visibility = "visible";
				retArea.scrollTop = retArea.scrollHeight;
				if(flag == 1){
					count_down = -1;
					refresh_flag = 0;
				}else{
					count_down = 5;
					refresh_flag = 1;
				}
				count_down_close();
				return false;
			}
			setTimeout("get_log(" + flag + ");", 500);
			retArea.value = response.myReplace("XU6J03M16", " ");
			retArea.scrollTop = retArea.scrollHeight;
		},
		error: function(){
			E("loading_block_title").innerHTML = "暂无日志信息 ...";
			E("log_content").value = "日志文件为空，请关闭本窗口！";
			E("ok_button").style.visibility = "visible";
		}
	});
}

function center_log_panel(){
	document.scrollingElement.scrollTop = 0;
	var page_h = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
	var page_w = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
	var log_h = E("loadingBarBlock").clientHeight;
	var log_w = E("loadingBarBlock").clientWidth;
	$("#loadingBarBlock").offset({top: (page_h - log_h) / 2, left: (page_w - log_w) / 2 + 90});
}

function showALLoadingBar(){
	document.scrollingElement.scrollTop = 0;
	E("loading_block_title").innerHTML = "&nbsp;&nbsp;SideStoreVPN 日志信息";
	E("LoadingBar").style.visibility = "visible";
	center_log_panel();
}

function hideALLoadingBar(){
	E("LoadingBar").style.visibility = "hidden";
	E("ok_button").style.visibility = "hidden";
	if(refresh_flag == "1"){
		refreshpage();
	}
}

function count_down_close(){
	if(count_down == "0"){
		hideALLoadingBar();
	}
	if(count_down < 0){
		E("ok_button1").value = "手动关闭";
		return false;
	}
	E("ok_button1").value = "自动关闭（" + count_down + "）";
	--count_down;
	setTimeout("count_down_close();", 1000);
}
</script>
</head>
<body id="app" skin='<% nvram_get("sc_skin"); %>' onload="init();">
	<div id="TopBanner"></div>
	<div id="Loading" class="popup_bg"></div>
	<div id="LoadingBar" class="popup_bar_bg_ks">
		<table cellpadding="5" cellspacing="0" id="loadingBarBlock" class="loadingBarBlock" align="center">
			<tr>
				<td height="100">
					<div id="loading_block_title" style="margin:10px auto;margin-left:10px;width:85%;font-size:12pt;"></div>
					<div id="loading_block_spilt" style="margin:10px 0 10px 5px;" class="loading_block_spilt">
						<li><font color="#ffcc00">请等待日志显示完毕，并出现自动关闭按钮！</font></li>
						<li><font color="#ffcc00">在此期间请不要刷新本页面，不然可能导致问题！</font></li>
					</div>
					<div style="margin-left:15px;margin-right:15px;margin-top:10px;outline:1px solid #3c3c3c;overflow:hidden">
						<textarea cols="50" rows="25" wrap="off" readonly="readonly" id="log_content" autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false" style="border:1px solid #000;width:99%;font-family:'Lucida Console';font-size:11px;background:transparent;color:#FFFFFF;outline:none;padding-left:5px;padding-right:22px;overflow-x:hidden"></textarea>
					</div>
					<div id="ok_button" class="apply_gen" style="background:#000;visibility:hidden;">
						<input id="ok_button1" class="button_gen" type="button" onclick="hideALLoadingBar();" value="确定">
					</div>
				</td>
			</tr>
		</table>
	</div>
	<table class="content" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td width="17">&nbsp;</td>
			<td valign="top" width="202">
				<div id="mainMenu"></div>
				<div id="subMenu"></div>
			</td>
			<td valign="top">
				<div id="tabMenu" class="submenuBlock"></div>
				<table width="98%" border="0" align="left" cellpadding="0" cellspacing="0">
					<tr>
						<td align="left" valign="top">
							<table width="760px" border="0" cellpadding="5" cellspacing="0" bordercolor="#6b8fa3" class="FormTitle" id="FormTitle">
								<tr>
									<td bgcolor="#4D595D" colspan="3" valign="top">
										<div>&nbsp;</div>
										<div class="formfonttitle">SideStoreVPN <lable id="sidestorevpn_version"></lable></div>
										<div style="float:right;width:15px;height:25px;margin-top:-20px">
											<img id="return_btn" alt="" onclick="reload_Soft_Center();" align="right" style="cursor:pointer;position:absolute;margin-left:-30px;margin-top:-25px;" title="返回软件中心" src="/images/backprev.png" onmouseover="this.src='/images/backprevclick.png'" onmouseout="this.src='/images/backprev.png'" />
										</div>
										<div style="margin:10px 0 10px 5px;" class="splitLine"></div>
										<div class="SimpleNote">
											<em>SideStoreVPN</em>&nbsp;通过 iptables 模拟 StosVPN/LocalDevVPN 的地址交换逻辑，让指定的内网苹果设备无需开启 StosVPN/LocalDevVPN 即可使用 SideStore。
											<span><a type="button" class="ks_btn" href="https://github.com/DemoJameson/KoolCenter.SideStoreVPN" target="_blank" style="margin-left:5px;">项目地址</a></span>
											<span><a type="button" class="ks_btn" href="javascript:void(0);" onclick="get_log(1)" style="margin-left:5px;">插件日志</a></span>
										</div>
										<div id="sidestorevpn_status_pannel">
											<table width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable">
												<thead>
													<tr>
														<td colspan="2">状态</td>
													</tr>
												</thead>
												<tr id="sidestorevpn_status_row">
													<th>状态</th>
													<td><span style="margin-left:4px" id="sidestorevpn_status">获取中...</span></td>
												</tr>
											</table>
										</div>
										<div style="margin-top:10px">
											<table width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable">
												<thead>
													<tr>
														<td colspan="2">设置</td>
													</tr>
												</thead>
												<tr>
													<th>虚拟 iTunes 设备 IP</th>
													<td class="sidestore-setting-cell">
														<div class="sidestore-setting-box">
															<input type="text" id="sidestorevpn_virtual_ip" class="input_15_table sidestore-input sidestore-vip-input" maxlength="18" autocomplete="off" autocorrect="off" autocapitalize="off" placeholder="10.7.0.1" />
															<span class="sidestore-setting-warning">除非确认 SideStore 使用了不同地址，否则不要随意更改。</span>
														</div>
													</td>
												</tr>
											</table>
										</div>
										<div style="margin-top:10px">
											<table width="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#6b8fa3" class="FormTable">
												<thead>
													<tr>
														<td colspan="2">设备列表</td>
													</tr>
												</thead>
												<tr>
													<td colspan="2" style="padding:14px 20px 12px 20px;">
														<div id="sidestore_device_table"></div>
														<textarea id="sidestorevpn_clients" class="sidestore-config-raw"></textarea>
													</td>
												</tr>
											</table>
										</div>
										<div id="sidestorevpn_apply" class="apply_gen">
											<p>&nbsp;</p>
											<input class="button_gen" style="display:none;" id="sidestorevpn_apply_1" onclick="save(1)" type="button" value="开启" />
											<input class="button_gen" style="display:none;" id="sidestorevpn_apply_2" onclick="save(2)" type="button" value="重启" />
											<input class="button_gen" style="display:none;" id="sidestorevpn_apply_3" onclick="save(0)" type="button" value="关闭" />
										</div>
										<div style="margin:10px 0 10px 5px;" class="splitLine"></div>
										<div style="margin:10px 0 0 5px">
											<li>1. 请为苹果设备绑定固定 IP，避免设备重连后规则指向旧地址。</li>
											<li>2. 如果苹果设备默认网关不是本路由，需要在上级网关添加到 iTunes 虚拟设备的静态路由。</li>
										</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
			<td width="10" align="center" valign="top"></td>
		</tr>
	</table>
	<div id="footer"></div>
</body>
</html>
