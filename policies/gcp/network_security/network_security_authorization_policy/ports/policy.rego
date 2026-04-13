package terraform.gcp.security.network_security.network_security_authorization_policy.ports
import data.terraform.helpers
import data.terraform.gcp.security.network_security.network_security_authorization_policy.vars

conditions := [
    [
        {
            "situation_description": "Only allow HTTPS request on port 443",
            "remedies": ["Set the destination port to an approved secure port 443"]
        },
        {
            "condition": "Authorization policy destination ports must be 443",
            "attribute_path": ["rules", 0, "destinations", 0, "ports"],
            "values": [443],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
