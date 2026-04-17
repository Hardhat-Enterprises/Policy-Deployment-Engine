package terraform.gcp.security.network_security.network_security_client_tls_policy.server_validation_ca
import data.terraform.helpers
import data.terraform.gcp.security.network_security.network_security_client_tls_policy.vars

conditions := [
    [
        {
            "situation_description": "Ensure server_validation_ca is configured to TLS validation",
            "remedies": ["Add server_validation_ca block with grpc_endpoint and valid target_uri"]
        },
        {
            "condition": "server_validation_ca must be defined",
            "attribute_path": ["server_validation_ca"],
            "policy_type": "whitelist",
            "values": ["*"]
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details