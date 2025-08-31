package terraform.gcp.security.Chronicle.data_access_scope.location
import data.terraform.gcp.helpers
import data.terraform.gcp.security.Chronicle.data_access_scope.vars

# Define allowed locations — adjust or expand based on your environment


# Conditions array describing the scenarios
conditions := [
    [
        {
            "situation_description": "The location attribute is missing or empty.",
            "remedies": ["Specify a valid location for the resource such as 'us', 'europe-west2', etc."]
        },
        {
            "condition": "Check if location is missing or empty",
            "attribute_path": ["location"],
            "values": [""],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "The location is not in the allowed list of Google Chronicle supported regions.",
            "remedies": [
                "Use a supported location such as 'australia-southeast1' and 'australia-southeast2'",
                "Consult Google Chronicle documentation for available locations."
            ]
        },
        {
            "condition": "Check if location is not in the allowed whitelist",
            "attribute_path": ["location"],
            "values": ["australia-southeast1","australia-southeast2"],
            "policy_type": "whitelist"
        }
    ]
]

# Summary message for compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed compliance info for debugging
details := helpers.get_multi_summary(conditions, vars.variables).details
