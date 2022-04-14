{{/*
Create input configuration for telegraf for additionnal indy networks.
*/}}
{{- define "indy-node-monitor.telegraf-input" -}}
[[inputs.http]]
    urls = [
    "http://indy-node-monitor:8080/networks/{{ . }}"
    ]
    name_override = "node"
    method = "GET"
    headers = {"seed" = "${{ . | upper }}_SEED"}
    timeout = "2m"
    success_status_codes = [200]
    data_format = "json"
    json_strict = true
    json_query = ""
    tag_keys = [
    "name",
    "network"
    ]
    json_string_fields = [
    "client-address",
    "node-address",
    "status_software_sovrin",
    "status_software_indy-node",
    "response_result_data_Node_info_Node_ip",
    "response_result_data_Node_info_Node_port",
    "response_result_data_Node_info_Client_ip",
    "response_result_data_Node_info_Client_port",
    "response_result_data_Node_info_Node_protocol",
    "status_ok",
    "response_result_data_Node_info_Mode",
    "response_result_data_Node_info_BLS_key",
    "response_result_data_Hardware_HDD_used_by_node",
    "response_result_data_Pool_info_Read_only",
    "response_result_data_Pool_info_Suspicious_nodes",
    "response_result_data_Pool_info_Quorums",
    "response_result_data_Software_OS_version",
    "response_result_data_Node_info_verkey",
    "response_result_data_Node_info_Catchup_status_Ledger_statuses",
    "response_result_data_Node_info_Catchup_status_Waiting_consistency_proof_msgs",
    "response_result_data_Node_info_Catchup_status_Last_txn_3PC_keys",
    "response_result_data_Node_info_Committed_ledger_root_hashes",
    "response_result_data_Node_info_Committed_state_root_hashes",
    "response_result_data_Node_info_Uncommitted_state_root_hashes",
    "response_result_data_Node_info_did",
    "response_result_data_Extractions_indy-node-status",
    "response_result_data_Extractions_node-control-status",
    "response_result_data_Extractions_upgrade_log",
    "response_result_data_Extractions_journalctl_exceptions",
    "response_result_data_Pool_info_Reachable_nodes",
    "response_result_data_Pool_info_Unreachable_nodes",
    "response_result_data_Software_Installed_packages",
    "response_result_data_Software_Indy_packages"
    ]
    json_time_key = "status_timestamp"
    json_time_format = "unix"
    json_timezone = ""
{{- end }}