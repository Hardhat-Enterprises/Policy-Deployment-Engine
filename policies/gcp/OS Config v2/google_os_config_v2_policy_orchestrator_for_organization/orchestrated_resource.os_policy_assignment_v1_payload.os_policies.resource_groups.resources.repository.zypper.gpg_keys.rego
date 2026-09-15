package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.orchestrated_resource_os_policy_assignment_v1_payload_os_policies_resource_groups_resources_repository_zypper_gpg_keys

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.vars

conditions := [
    [
        {
            "situation_description": "Zypper repository GPG key sources must use secure HTTPS locations to help prevent untrusted keys from being retrieved.",
            "remedies": ["Use an approved HTTPS URI for the Zypper repository GPG key."]
        },
        {
            "condition": "Zypper repository GPG key URIs must not use HTTP.",
            "attribute_path": [
                "orchestrated_resource", 0,
                "os_policy_assignment_v1_payload", 0,
                "os_policies", 0,
                "resource_groups", 0,
                "resources", 0,
                "repository", 0,
                "zypper", 0,
                "gpg_keys"
            ],
            "values": ["http://"],
            "policy_type": "element blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details