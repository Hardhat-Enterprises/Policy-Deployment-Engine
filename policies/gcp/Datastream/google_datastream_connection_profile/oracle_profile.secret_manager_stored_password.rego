package terraform.gcp.security.datastream.google_datastream_connection_profile.oracle_profile_secret_manager_stored_password

import data.terraform.helpers
import data.terraform.gcp.security.datastream.google_datastream_connection_profile.vars

conditions := [
    [
        {
            "situation_description": "The Oracle password reference does not use the latest Secret Manager version, which may prevent centrally rotated credentials from being applied.",
            "remedies": [
                "Store the Oracle password in Google Secret Manager.",
                "Configure secret_manager_stored_password instead of embedding password directly.",
                "Use the resource format projects/{project}/secrets/{secret}/versions/latest.",
                "Grant access to the secret using least-privilege IAM permissions."
            ]
        },
        {
            "condition": "Check whether the Oracle stored-password reference uses the latest Secret Manager version.",
            "attribute_path": [
                "oracle_profile",
                0,
                "secret_manager_stored_password"
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
