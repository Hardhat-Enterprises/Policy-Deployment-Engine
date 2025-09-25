package terraform.gcp.security.os_config_v2.policy_orchestrator_for_organization.orchestrated_resource
import data.terraform.gcp.helpers
import data.terraform.gcp.security.os_config_v2.policy_orchestrator_for_organization.vars

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
    ],
    [
    {"situation_description" : "OS-Policies does not allow mode to be unspecified",
    "remedies" : ["Make use of VALIDATION or ENFORCEMENT mode that allows you to utilize the build feature before deployment"]},
    {
        "condition": "Unspecified mode is not allowed to be used in orchestrated resource",
        "attribute_path" : ["orchestrated_resource",0,"os_policy_assignment_v1_payload",0,"os_policies",0,"mode"], 
        "values" : ["MODE_UNSPECIFIED"],
        "policy_type" : "blacklist" 
    }
    ],
    [
    {"situation_description" : "You are not using the assigned package manager repository archive type for secured installations and trusted sources",
    "remedies" : ["Make sure to use the correct package manager repository archive type for your OS for secured installations and trusted sources"]},
    {
        "condition": "Only DEB and DEB_SRC archive types are allowed to be used in orchestrated resource",
        "attribute_path" : ["orchestrated_resource",0,"os_policy_assignment_v1_payload",0,"os_policies",0,"resource_groups",0,"resources",0,"repository",0,"apt",0,"archive_type"], 
        "values" : ["DEB","DEB_SRC"],
        "policy_type" : "whitelist" 
    }
    ],
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details