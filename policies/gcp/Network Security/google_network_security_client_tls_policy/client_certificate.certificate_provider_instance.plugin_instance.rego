package terraform.gcp.security.network_security.google_network_security_client_tls_policy.client_certificate.certificate_provider_instance.plugin_instance
import data.terraform.helpers
import data.terraform.gcp.security.network_security.google_network_security_client_tls_policy.vars

conditions := [
  [
    {
      "situation_description" : "Client mTLS identity certificate should be provisioned via the managed Certificate Authority Service provider",
      "remedies":[
        "Set client_certificate.certificate_provider_instance.plugin_instance to google_cloud_private_spiffe"
      ]
    },
    {
      "condition": "c1 plugin_instance is google_cloud_private_spiffe",
      "attribute_path" : ["client_certificate", 0, "certificate_provider_instance", 0, "plugin_instance"],
      "values" : ["google_cloud_private_spiffe"],
      "policy_type" : "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
