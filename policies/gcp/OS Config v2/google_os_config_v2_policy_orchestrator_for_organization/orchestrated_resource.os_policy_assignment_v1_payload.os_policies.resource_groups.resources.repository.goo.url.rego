package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.orchestrated_resource_os_policy_assignment_v1_payload_os_policies_resource_groups_resources_repository_goo_url

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.vars

conditions := [
    [
        {"situation_description" : "Goo repository URLs must use an approved secure HTTPS source.",
        "remedies" : ["Use an approved HTTPS repository URL."]},
        {
            "condition": "Goo repository URL must be the approved HTTPS repository.",
            "attribute_path" : ["orchestrated_resource",0,"os_policy_assignment_v1_payload",0,"os_policies",0,"resource_groups",0,"resources",0,"repository",0,"goo",0,"url"],
            "values" : ["https://packages.example.com/repository"],
            "policy_type" : "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details