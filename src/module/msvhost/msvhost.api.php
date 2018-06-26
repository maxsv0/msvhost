<?php

function ajaxRunServer($module) {
	server_proccess("ready");
	sleep(1);
	server_proccess("install");
	sleep(1);
	server_proccess("started");
	sleep(1);
	server_proccess("created");
	sleep(1);
	server_proccess("published");
	sleep(1);
	server_proccess("deleting");

	echo "success";
}


function ajax_create_instance() {
	if (empty($_FILES["file"])) return false;
	$cont = file_get_contents($_FILES["file"]["tmp_name"]);
	if (!$cont) return false;

	$item = array(
		"url" => "",
		"published" => 1,
		"name" => "",
		"ip" => msv_get_ip(),
		"status" => "created",
		"log_install" => $cont,
	);

	$result = db_add(TABLE_INSTANCE, $item);
	unset($result["sql"]);

	return json_encode($result);
}


function ajaxInstanceStatus() {
	if (empty($_FILES["file"])) return false;
	$cont = file_get_contents($_FILES["file"]["tmp_name"]);
	if (!$cont) return false;

	$item = array(
		"url" => "",
		"published" => 1,
		"ip" => msv_get_ip(),
		"log_report" => $cont,
	);

	$result = db_add(TABLE_INSTANCE_STATUS, $item);
	unset($result["sql"]);

	return json_encode($result);
}
