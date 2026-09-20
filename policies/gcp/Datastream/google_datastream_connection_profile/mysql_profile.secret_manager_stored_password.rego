package terraform.gcp.security.datastream.google_datastream_connection_profile.mysql_profile_secret_manager_stored_password

import data.terraform.helpers
import data.terraform.gcp.security.datastream.google_datastream_connection_profile.vars

conditions := [
    [
        {
            "situation_description": "The MySQL password is not referenced through Google Secret Manager, which may expose the credential or prevent centralised access control, auditing, and rotation.",
            "remedies": [
                "Store the MySQL password in Google Secret Manager.",
                "Configure secret_manager_stored_password instead of embedding password directly.",
                "Use the format projects/{project}/secrets/{secret}/versions/{version}."
            ]
        },
        {
            "condition": "Check whether a Secret Manager reference is configured for the MySQL password.",
            "attribute_path": [
                "mysql_profile",
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
            "situation_description": "The MySQL password reference does not follow the required Secret Manager secret-version resource format.",
            "remedies": [
                "Use a structurally valid Secret Manager secret-version reference.",
                "Use the format projects/{project}/secrets/{secret}/versions/{version}.",
                "Use either a numeric secret version or an approved version alias."
            ]
        },
        {
            "condition": "Check whether the MySQL password reference follows the Secret Manager secret-version resource format.",
            "attribute_path": [
                "mysql_profile",
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
