package terraform.gcp.security.chronicle.data_access_scope.allowed_location
import data.terraform.gcp.helpers
import data.terraform.gcp.security.chronicle.data_access_scope.vars


conditions := [

    [
        {
            "situation_description": "The location is not in the allowed list of Google Chronicle supported regions.",
            "remedies": [
                "Use a supported location such as 'australia-southeast1'",
                "Consult Google Chronicle documentation for available locations."
            ]
        },
        {
            "condition": "Check if location is not in the allowed whitelist",
            "attribute_path": ["location"],
            "values": ["australia-southeast1"],
            "policy_type": "whitelist"
        }
    ]
]

# Summary message for compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed compliance info for debugging
details := helpers.get_multi_summary(conditions, vars.variables).details
