package terraform.gcp.security.network_security.google_network_security_client_tls_policy.server_validation_ca_grpc_endpoint_target_uri
import data.terraform.helpers
import data.terraform.gcp.security.network_security.google_network_security_client_tls_policy.vars

conditions := [
    [
        {
            "situation_description": "Ensure server_validation_ca uses a valid unix target_uri",
            "remedies": ["Set server_validation_ca.grpc_endpoint.target_uri to unix:mypath"]
        },
        {
            "condition": "server_validation_ca.grpc_endpoint.target_uri must be unix:mypath",
            "attribute_path": ["server_validation_ca", 0, "grpc_endpoint", 0, "target_uri"],
            "values": ["unix:mypath"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
