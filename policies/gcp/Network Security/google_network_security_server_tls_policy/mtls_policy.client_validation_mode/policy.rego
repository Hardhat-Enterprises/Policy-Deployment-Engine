package terraform.gcp.security.network_security.google_network_security_server_tls_policy.mtls_policy_client_validation_mode
import data.terraform.helpers
import data.terraform.gcp.security.network_security.google_network_security_server_tls_policy.vars

conditions := [
    [
        {
            "situation_description": "Ensure mtls_policy is configured for the server TLS policy",
            "remedies": ["Add the mtls_policy block to the server TLS policy"]
        },
        {
            "condition": "Server TLS policy must define mtls_policy",
            "attribute_path": ["mtls_policy", 0],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
