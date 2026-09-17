package terraform.gcp.security.google_alloydb_instance.database_flags

import data.terraform.helpers
import data.terraform.gcp.security.alloydb.google_alloydb_instance.vars

conditions := [
    [
        {
            "situation_description": "The AlloyDB instance should not use database flags that reduce appropriate security logging or expose excessive database-engine diagnostic information.",
            "remedies": [
                "Review database_flags and remove insecure or unnecessarily verbose database-engine settings.",
                "Use approved secure database flag values based on the organisation's database security baseline."
            ]
        },
        {
            "condition": "The database_flags attribute must not contain insecure database flag values.",
            "attribute_path": ["database_flags"],
            "values": [
                "DEBUG",
                "TRACE"
            ],
            "policy_type": "element blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details