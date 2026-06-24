package terraform.gcp.security.network_security.google_network_security_client_tls_policy.sni
import data.terraform.helpers
import data.terraform.gcp.security.network_security.google_network_security_client_tls_policy.vars

conditions := [
    [
        {
            "situation_description": "Ensure SNI is set to a secure and approved domain",
            "remedies": ["Set the sni attribute to 'secure.com'"]
        },
        {
            "condition": "Client TLS policy SNI must be secure.com",
            "attribute_path": ["sni"],
            "values": ["secure.com"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details