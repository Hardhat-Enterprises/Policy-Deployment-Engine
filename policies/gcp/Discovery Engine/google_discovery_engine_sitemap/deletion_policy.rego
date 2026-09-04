package terraform.gcp.security.discovery_engine.google_discovery_engine_sitemap.deletion_policy

import data.terraform.helpers  
import data.terraform.gcp.security.google_discovery_engine_sitemap_vars

conditions:= [
    [
        {
            "situation description" : "sitemap deletion should require protection against accidental removal"
            "remedies": [
                "set deletion_policy to Prevent",
                "set deletion_policy to Abandon"
            ]
        },
        {
            "condition" : "deletion_policy must be an approved value",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT","ABANDON"],
            "policy_type" : "whitelist"
        }

    ]
]

result := helpers.get_multi_summary(condition, vars.variables)
message := result.message
details := result.details