package terraform.gcp.security.network_security.google_network_security_authorization_policy.action
import data.terraform.helpers
import data.terraform.gcp.security.network_security.google_network_security_authorization_policy.vars

conditions := [
    [
        {
            "situation_description": "Only allow action value ALLOW",
            "remedies": ["Set the action to ALLOW"]
        },
        {
            "condition": "Authorization policy action must be ALLOW",
            "attribute_path": ["action"],
            "values": ["ALLOW"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details