package terraform.gcp.security.network_security.google_network_security_backend_authentication_config.client_certificate
import data.terraform.helpers
import data.terraform.gcp.security.network_security.google_network_security_backend_authentication_config.vars

conditions := [
  [
    {
      "situation_description" : "A client certificate should be explicitly configured for mTLS authentication rather than left unset",
      "remedies":[
        "Set client_certificate to an explicitly configured certificate"
      ]
    },
    {
      "condition": "c1 client_certificate is set",
      "attribute_path" : ["client_certificate"],
      "values" : [null],
      "policy_type" : "blacklist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
