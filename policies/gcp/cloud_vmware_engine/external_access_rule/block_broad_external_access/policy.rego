package terraform.gcp.security.cloud_vmware_engine.external_access_rule.block_broad_external_access
import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_vmware_engine.external_access_rule.vars



conditions := [
    [
    {"situation_description" : "ip range is too broad",
    "remedies":[ "Set  ip range for required ips and make sure that all ports are not opened"]},
    {
        "condition": "c1 0.0.0.0/0 not allowed",
        "attribute_path" : ["source_ip_ranges",0,"ip_address_range"], 
        "values" : ["0.0.0.0/0"],
        "policy_type" : "blacklist" 
    },

        {
        "condition": "c2 valid for tcp or udp",
        "attribute_path" : ["ip_protocol"], 
        "values" : ["TCP","UDP"],
        "policy_type" : "blacklist"
    },

    {
        "condition": "c3 check if all ports are open",
        "attribute_path" : ["source_ports",0],
        "values" : ["*"], 
        "policy_type" : "blacklist" 
    }

    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message


details := helpers.get_multi_summary(conditions, vars.variables).details