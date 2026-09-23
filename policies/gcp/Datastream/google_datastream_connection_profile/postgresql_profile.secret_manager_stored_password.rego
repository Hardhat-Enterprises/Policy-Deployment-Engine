package terraform.gcp.security.datastream.google_datastream_connection_profile.postgresql_profile_secret_manager_stored_password

import data.terraform.helpers
import data.terraform.gcp.security.datastream.google_datastream_connection_profile.vars

conditions := [
    [
        {
            "situation_description": "The PostgreSQL password is not referenced through Google Secret Manager, which may expose the credential or prevent centralised access control, auditing, and rotation.",
            "remedies": [
                "Store the PostgreSQL password in Google Secret Manager.",
                "Configure secret_manager_stored_password instead of embedding password directly.",
                "Use the format projects/{project}/secrets/{secret}/versions/{version}."
            ]
        },
        {
            "condition": "Check whether a Secret Manager reference is configured for the PostgreSQL password.",
            "attribute_path": [
                "postgresql_profile",
                0,
                "secret_manager_stored_password"
            ],
            "values": [
                null,
                ""
            ],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "The PostgreSQL password reference does not follow the required Secret Manager secret-version resource format.",
            "remedies": [
                "Use a structurally valid Secret Manager secret-version reference.",
                "Use the format projects/{project}/secrets/{secret}/versions/{version}.",
                "Use either a numeric secret version or an approved version alias."
            ]
        },
        {
            "condition": "Check whether the PostgreSQL password reference follows the Secret Manager secret-version resource format.",
            "attribute_path": [
                "postgresql_profile",
                0,
                "secret_manager_stored_password"
            ],
            "values": [
                "projects/*/secrets/*/versions/*"
            ],
            "policy_type": "element pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
