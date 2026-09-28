package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator.orchestrated_resource_os_policy_assignment_v1_payload_os_policies_resource_groups_resources_repository_apt_uri

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator.vars

conditions := [
    [
        {
            "situation_description": "Only approved secure locations are allowed for APT repositories added to the VM",
            "remedies": ["Use an approved HTTPS URI for the APT repository"]
        },
        {
            "condition": "Check if the APT repository URI uses HTTPS",
            "attribute_path": ["orchestrated_resource",0,"os_policy_assignment_v1_payload",0,"os_policies",0,"resource_groups",0,"resources",0,"repository",0,"apt",0,"uri"],
            "values": ["*://*", [["https"]]],
            "policy_type": "pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details