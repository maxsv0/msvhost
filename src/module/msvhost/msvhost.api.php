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


function ajaxInstanceAPI($module) {

    $request = msv_get('website.requestUrlMatch');
    $apiName = $request[1];
    $apiType = $request[2];

    switch ($apiType) {
        case "list":
            if (!msv_check_accessuser($module->accessAPIList)) {
                $resultQuery = array(
                    "ok" => false,
                    "data" => array(),
                    "msg" => _t("msg.api.no_access"),
                );
            } else {
                $resultQuery = db_get_list(TABLE_INSTANCE, "", "`date_create` desc", 999, "");
            }
            break;
        case "list-url":
            if (!msv_check_accessuser($module->accessAPIList)) {
                $resultQuery = array(
                    "ok" => false,
                    "data" => array(),
                    "msg" => _t("msg.api.no_access"),
                );
            } else {
                $resultQuery = db_get_list(TABLE_INSTANCE, "", "`date_create` desc", 999, "");

                $list = array();
                foreach ($resultQuery["data"] as $item) {
                    $list[] = $item["url"];
                }
                $resultQuery["data"] = $list;
            }
            break;
        case "details":
            if (!msv_check_accessuser($module->accessAPIDetails)) {
                $resultQuery = array(
                    "ok" => false,
                    "data" => array(),
                    "msg" => _t("msg.api.no_access"),
                );
            } else {
                $instanceID = (int)$request[3];
                $resultQuery = db_get(TABLE_INSTANCE, " id = '".$instanceID."'");
            }
            break;
        case "edit":
            if (!msv_check_accessuser($module->accessAPIEdit)) {
                $resultQuery = array(
                    "ok" => false,
                    "data" => array(),
                    "msg" => _t("msg.api.no_access"),
                );
            } else {
                if (!empty($_REQUEST["url"])) {
                    if (array_key_exists("preview", $_FILES) && !empty($_FILES["preview"]["tmp_name"])) {
                        $fileResult = msv_store_pic($_FILES["preview"]["tmp_name"], "png", $_FILES["preview"]["name"], TABLE_INSTANCE, "preview");
                        if (!is_numeric($fileResult)) {
                            $resultQuery = db_update(TABLE_INSTANCE, "preview", "'".db_escape($fileResult)."'", "`url` like '".db_escape($_REQUEST["url"])."'");
                        }
                    }
                } elseif (empty($_REQUEST["updateName"]) || empty($_REQUEST["updateID"]) || !isset($_REQUEST["updateValue"]) ) {
                    $resultQuery = array(
                        "ok" => false,
                        "data" => array(),
                        "msg" => _t("msg.api.wrong_api"),
                    );
                } else {
                    $resultQuery = db_update(TABLE_INSTANCE, $_REQUEST["updateName"], "'".db_escape($_REQUEST["updateValue"])."'", "`id` = ".(int)$_REQUEST["updateID"]);
                }
            }
            break;
        default:
            $resultQuery = array(
                "ok" => false,
                "data" => array(),
                "msg" => _t("msg.api.wrong_api"),
            );
            break;
    }

    // do not output sql for security reasons
    unset($resultQuery["sql"]);

    // output result as JSON
    return json_encode($resultQuery);
}