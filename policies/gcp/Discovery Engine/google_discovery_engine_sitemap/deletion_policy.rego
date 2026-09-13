package terraform.gcp.security.discovery_engine.google_discovery_engine_sitemap.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_sitemap.vars

conditions := [
    [
        {
            "situation_description": "Sitemap deletion should require protection against accidental removal",
            "remedies": [
                "Set deletion_policy to PREVENT",
                "Set deletion_policy to ABANDON"
            ]
        },
        {
            "condition": "deletion_policy must be an approved value",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT", "ABANDON"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
