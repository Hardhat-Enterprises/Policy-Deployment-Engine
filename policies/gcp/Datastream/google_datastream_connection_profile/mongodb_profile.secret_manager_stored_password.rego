package terraform.gcp.security.datastream.google_datastream_connection_profile.mongodb_profile_secret_manager_stored_password

import data.terraform.helpers
import data.terraform.gcp.security.datastream.google_datastream_connection_profile.vars

conditions := [
    [
        {
            "situation_description": "The MongoDB password reference does not use the latest Secret Manager secret version, which may prevent centrally rotated credentials from being used.",
            "remedies": [
                "Store the MongoDB connection password in Google Secret Manager.",
                "Reference the password through secret_manager_stored_password.",
                "Use the resource format projects/{project}/secrets/{secret}/versions/latest.",
                "Grant access to the secret using least-privilege IAM permissions."
            ]
        },
        {
            "condition": "Check whether the MongoDB stored-password reference uses the latest Secret Manager version.",
            "attribute_path": [
                "mongodb_profile",
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

# Evaluate the configured conditions against each connection profile.
result := helpers.get_multi_summary(conditions, vars.variables)

# Display the overall compliance result.
message := result.message

# Display detailed results for each connection profile.
details := result.details
