package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.orchestrated_resource_os_policy_assignment_v1_payload_os_policies_resource_groups_resources_exec_validate_file_remote_uri

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.vars

conditions := [
    [
    {"situation_description" : "Only approved secure remote file locations are allowed for files used during validation",
    "remedies" : ["Use an approved HTTPS remote URI for files used during validation"]},
    {
        "condition": "Check if the remote URI is an approved HTTPS location",
        "attribute_path" : ["orchestrated_resource",0,"os_policy_assignment_v1_payload",0,"os_policies",0,"resource_groups",0,"resources",0,"exec",0,"validate",0,"file",0,"remote",0,"uri"],
        "values" : ["https://example.com/script.sh"],
        "policy_type" : "whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details