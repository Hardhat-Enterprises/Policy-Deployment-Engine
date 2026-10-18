package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.orchestrated_resource_os_policy_assignment_v1_payload_os_policies_resource_groups_resources_repository_goo_url

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.vars

conditions := [
    [
        {
            "situation_description": "Goo repository URLs must use HTTPS to protect repository content from insecure transport",
            "remedies": ["Use an HTTPS URL for the Goo repository"]
        },
        {
            "condition": "Check that the Goo repository URL uses HTTPS",
            "attribute_path": [
                "orchestrated_resource",
                0,
                "os_policy_assignment_v1_payload",
                0,
                "os_policies",
                0,
                "resource_groups",
                0,
                "resources",
                0,
                "repository",
                0,
                "goo",
                0,
                "url"
            ],
            "values": ["*://*", [["https"]]],
            "policy_type": "pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details