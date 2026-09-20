package terraform.gcp.security.datastream.google_datastream_connection_profile.mongodb_profile_ssl_config_secret_manager_stored_client_key

import data.terraform.helpers
import data.terraform.gcp.security.datastream.google_datastream_connection_profile.vars

conditions := [
    [
        {
            "situation_description": "The MongoDB TLS client private key is not referenced through Google Secret Manager, which may expose private-key material.",
            "remedies": [
                "Store the PEM-encoded client private key in Google Secret Manager.",
                "Configure secret_manager_stored_client_key instead of embedding client_key.",
                "Use the format projects/{project}/secrets/{secret}/versions/{version}."
            ]
        },
        {
            "condition": "Check whether a Secret Manager reference is configured for the MongoDB TLS client key.",
            "attribute_path": [
                "mongodb_profile",
                0,
                "ssl_config",
                0,
                "secret_manager_stored_client_key"
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
            "situation_description": "The MongoDB TLS client-key reference does not follow the required Secret Manager secret-version resource format.",
            "remedies": [
                "Use a structurally valid Secret Manager secret-version reference.",
                "Use the format projects/{project}/secrets/{secret}/versions/{version}.",
                "Use either a numeric version or an approved version alias."
            ]
        },
        {
            "condition": "Check whether the MongoDB TLS client-key reference follows the Secret Manager secret-version resource format.",
            "attribute_path": [
                "mongodb_profile",
                0,
                "ssl_config",
                0,
                "secret_manager_stored_client_key"
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
