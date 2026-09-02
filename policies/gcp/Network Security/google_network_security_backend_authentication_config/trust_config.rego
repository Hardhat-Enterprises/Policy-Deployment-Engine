package terraform.gcp.security.network_security.google_network_security_backend_authentication_config.trust_config
import data.terraform.helpers
import data.terraform.gcp.security.network_security.google_network_security_backend_authentication_config.vars

conditions := [
  [
    {
      "situation_description" : "A trust config should be explicitly configured to validate backend server certificates rather than left unset",
      "remedies":[
        "Set trust_config to an explicitly configured TrustConfig"
      ]
    },
    {
      "condition": "c1 trust_config is set",
      "attribute_path" : ["trust_config"],
      "values" : [null],
      "policy_type" : "blacklist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
