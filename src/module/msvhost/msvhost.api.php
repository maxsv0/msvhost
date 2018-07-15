<?php

function ajaxInstanceStatus($module) {
    if (empty($_REQUEST["instance"]) || empty($_REQUEST["status"])) {
        return json_encode(array(
            "ok" => false,
            "data" => array(),
            "msg" => _t("msg.api.wrong_api"),
        ));
    }

    $resultQuery = db_get(TABLE_INSTANCE, " `name` like '".$_REQUEST["instance"]."'");
    if ($resultQuery["ok"] && !empty($resultQuery["data"])) {
        $instance = $resultQuery["data"];

        $item = array(
            "url" => "",
            "published" => 1,
            "instance" => $instance["id"],
            "ip" => msv_get_ip(),
            "log_report" => $_REQUEST["status"],
        );

        $resultQuery = db_add(TABLE_INSTANCE_STATUS, $item);

        if ($resultQuery["ok"]) {
            db_update(TABLE_INSTANCE, "status", "'" . db_escape($_REQUEST["status"]) . "'", " `id` = '" . $instance["id"] . "'");
            db_update(TABLE_INSTANCE, "status_date", "NOW()", " `id` = '" . $instance["id"] . "'");
        }
    }

    unset($resultQuery["sql"]);

    return json_encode($resultQuery);
}
