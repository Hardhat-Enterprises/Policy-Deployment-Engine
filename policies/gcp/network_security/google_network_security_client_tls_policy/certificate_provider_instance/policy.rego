package terraform.gcp.security.network_security.google_network_security_client_tls_policy.certificate_provider_instance
import data.terraform.helpers
import data.terraform.gcp.security.network_security.google_network_security_client_tls_policy.vars

conditions := [
    [
        {
            "situation_description": "Only allow the approved certificate provider plugin for the client certificate",
            "remedies": ["Set server_certificate.certificate_provider_instance.plugin_instance to google_cloud_private_spiffe"]
        },
        {
            "condition": "Client TLS policy certificate provider instance must use google_cloud_private_spiffe",
            "attribute_path": ["client_certificate", 0, "certificate_provider_instance", 0, "plugin_instance"],
            "values": ["google_cloud_private_spiffe"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details