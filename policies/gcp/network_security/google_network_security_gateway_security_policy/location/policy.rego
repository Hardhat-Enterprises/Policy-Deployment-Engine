package terraform.gcp.security.network_security.google_network_security_gateway_security_policy.location
import data.terraform.helpers
import data.terraform.gcp.security.network_security.google_network_security_gateway_security_policy.vars

conditions := [
    [
        {
            "situation_description": "Location must be in Australia region",
            "remedies": ["Set the location to australia-southeast1"]
        },
        {
            "condition": "Set Gateway location to australia-southeast1",
            "attribute_path": ["location"],
            "values": ["australia-southeast1"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details