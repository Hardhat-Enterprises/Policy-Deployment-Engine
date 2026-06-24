package terraform.gcp.security.os_config_v2.policy_orchestrator.orchestrated_resource_os_policy_assignment_v1_payload_os_policies_resource_groups_resources_repository_apt_archive_type
import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.policy_orchestrator.vars

conditions := [
    [
    {"situation_description" : "You are not using the assigned package manager repository archive type for secured installations and trusted sources",
    "remedies" : ["Make sure to use the correct package manager repository archive type for your OS for secured installations and trusted sources"]},
    {
        "condition": "Only DEB and DEB_SRC archive types are allowed to be used in orchestrated resource",
        "attribute_path" : ["orchestrated_resource",0,"os_policy_assignment_v1_payload",0,"os_policies",0,"resource_groups",0,"resources",0,"repository",0,"apt",0,"archive_type"], 
        "values" : ["DEB","DEB_SRC"],
        "policy_type" : "whitelist" 
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
