package terraform.gcp.security.datastream.google_datastream_connection_profile.mongodb_profile_ssl_config_secret_manager_stored_client_key

import data.terraform.helpers
import data.terraform.gcp.security.datastream.google_datastream_connection_profile.vars

conditions := [
    [
        {
            "situation_description": "The MongoDB TLS client private-key reference does not use the latest Secret Manager version, which may prevent approved key rotations from being applied.",
            "remedies": [
                "Store the PEM-encoded MongoDB TLS client private key in Secret Manager.",
                "Configure secret_manager_stored_client_key instead of embedding client_key directly.",
                "Use the resource format projects/{project}/secrets/{secret}/versions/latest.",
                "Grant access to the private-key secret using least-privilege IAM permissions."
            ]
        },
        {
            "condition": "Check whether the MongoDB TLS client-key reference uses the latest Secret Manager version.",
            "attribute_path": [
                "mongodb_profile",
                0,
                "ssl_config",
                0,
                "secret_manager_stored_client_key"
            ],
            "values": [
                "versions/*",
                [
                    [
                        "latest"
                    ]
                ]
            ],
            "policy_type": "pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details