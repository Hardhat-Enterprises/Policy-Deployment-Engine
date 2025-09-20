package terraform.gcp.security.lustre.lustre_instance.allowed_location
import data.terraform.gcp.helpers
import data.terraform.gcp.security.lustre.lustre_instance.vars


conditions := [

    [
        {
            "situation_description": "The location is not in the allowed list of Google Lustre supported regions.",
            "remedies": [
                "Use a supported location such as 'australia-southeast1-a'",
                "Consult Google Lustre documentation for available locations."
            ]
        },
        {
            "condition": "Check if location is not in the allowed whitelist",
            "attribute_path": ["location"],
            "values": ["australia-southeast1-a","australia-southeast1-b"],
            "policy_type": "whitelist"
        }
    ]
]

# Summary message for compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed compliance info for debugging
details := helpers.get_multi_summary(conditions, vars.variables).details