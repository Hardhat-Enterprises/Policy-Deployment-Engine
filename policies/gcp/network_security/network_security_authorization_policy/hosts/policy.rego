package terraform.gcp.security.network_security.network_security_authorization_policy.hosts
import data.terraform.helpers
import data.terraform.gcp.security.network_security.network_security_authorization_policy.vars

conditions := [
    [
        {
            "situation_description": "Only allowed host value example.com",
            "remedies": ["Set the destination host to example.com"]
        },
        {
            "condition": "Authorization policy destination hosts must be example.com",
            "attribute_path": ["rules", 0, "destinations", 0, "hosts"],
            "values": ["example.com"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details