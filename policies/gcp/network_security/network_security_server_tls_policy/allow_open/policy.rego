package terraform.gcp.security.network_security.network_security_server_tls_policy.allow_open
import data.terraform.helpers
import data.terraform.gcp.security.network_security.network_security_server_tls_policy.vars

conditions := [
    [
        {
            "situation_description": "Only secure server TLS policies should be allowed",
            "remedies": ["Set allow_open to false"]
        },
        {
            "condition": "Server TLS policy allow_open must be false",
            "attribute_path": ["allow_open"],
            "values": [false],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details