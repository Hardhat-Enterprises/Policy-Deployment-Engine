package terraform.gcp.security.datastream.google_datastream_connection_profile.mongodb_profile_ssl_config_secret_manager_stored_client_key

import data.terraform.helpers
import data.terraform.gcp.security.datastream.google_datastream_connection_profile.vars

conditions := [
    [
        {
            "situation_description": "The configured MongoDB TLS client private-key reference does not follow the required Google Secret Manager secret-version resource format.",
            "remedies": [
                "Store the PEM-encoded MongoDB TLS client private key in Google Secret Manager.",
                "Configure secret_manager_stored_client_key instead of embedding private-key material through client_key.",
                "Use the format projects/{project}/secrets/{secret}/versions/{version}.",
                "Grant access to the private-key secret using least-privilege IAM permissions."
            ]
        },
        {
            "condition": "When configured, check whether the MongoDB TLS client-key reference follows the Secret Manager secret-version resource format.",
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
