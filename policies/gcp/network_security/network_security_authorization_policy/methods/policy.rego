package terraform.gcp.security.network_security.network_security_authorization_policy.methods
import data.terraform.helpers
import data.terraform.gcp.security.network_security.network_security_authorization_policy.vars

conditions := [
    [
        {
            "situation_description": "Only allow HTTPs method GET",
            "remedies": ["Set the destination method to GET"]
        },
        {
            "condition": "Authorization policy destination methods must be GET",
            "attribute_path": ["rules", 0, "destinations", 0, "methods"],
            "values": ["GET"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details