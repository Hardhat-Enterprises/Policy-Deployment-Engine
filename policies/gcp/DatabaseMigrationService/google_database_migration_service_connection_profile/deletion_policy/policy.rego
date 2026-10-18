package terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.database_migration_service.google_database_migration_service_connection_profile.vars

conditions := [
    [
        {
            "situation_description": "The DMS connection profile is not protected from deletion.",
            "remedies": [
                "Set deletion_policy to PREVENT."
            ]
        },
        {
            "condition": "Set deletion_policy to PREVENT.",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
