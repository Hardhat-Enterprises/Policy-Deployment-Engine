package terraform.gcp.security.os_config_v2.policy_orchestrator.orchestrated_resource_os_policy_assignment_v1_payload_instance_filter_inventories_os_short_name
import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.policy_orchestrator.vars

conditions := [
    [
    {"situation_description" : "Only Debian machine is allowed to access the orchestrated resource",
    "remedies" : ["Any Virtual machine which is not DEBIAN based will not be able to access the orchestrated resource"]},
    {
        "condition": "Check if the os-short name is DEBIAN",
        "attribute_path" : ["orchestrated_resource",0,"os_policy_assignment_v1_payload",0,"instance_filter",0,"inventories",0,"os_short_name"], 
        "values" : ["Debian"],
        "policy_type" : "whitelist" 
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
