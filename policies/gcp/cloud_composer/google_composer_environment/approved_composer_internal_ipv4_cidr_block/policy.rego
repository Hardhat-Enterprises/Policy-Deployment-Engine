package terraform.gcp.security.cloud_composer.google_composer_environment.approved_composer_internal_ipv4_cidr_block

import data.terraform.helpers
import data.terraform.gcp.security.cloud_composer.google_composer_environment.vars

conditions := [

    [
        {
            "situation_description": "Cloud Composer environment is configured with internal IP CIDR range that is not approved by organization.",
            "remedies": [
                "Use an approved CIDR range such as '10.0.0.0/20' or '10.1.0.0/20'.",
                "Ensure the internal IP range aligns with organizational network policies."
            ]
        },
        {
            "condition": "Check if composer_internal_ipv4_cidr_block is not in the allowed whitelist",
            "attribute_path": ["config", 0, "node_config", 0, "composer_internal_ipv4_cidr_block"],
            "values": ["10.0.0.0/20", "10.1.0.0/20"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details