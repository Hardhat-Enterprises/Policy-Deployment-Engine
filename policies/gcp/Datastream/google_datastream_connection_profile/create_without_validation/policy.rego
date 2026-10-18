package terraform.gcp.security.datastream.google_datastream_connection_profile.create_without_validation

import data.terraform.helpers
import data.terraform.gcp.security.datastream.google_datastream_connection_profile.vars

conditions := [
    [
        {
            "situation_description": "The Datastream connection profile is created without validation, which could allow unverified credentials, endpoints, or connectivity settings to be accepted.",
            "remedies": [
                "Set create_without_validation to false.",
                "Allow Datastream to validate the connection profile before creation.",
                "Review and correct any credentials or connectivity settings that fail validation."
            ]
        },
        {
            "condition": "Check whether create_without_validation is not set to true.",
            "attribute_path": ["create_without_validation"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

# Evaluates the conditions once and stores the summary
result := helpers.get_multi_summary(conditions, vars.variables)

# Displays a general message about policy compliance
message := result.message

# Displays detailed compliance results for each resource
details := result.details
