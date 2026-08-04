package terraform.gcp.security.network_security.google_network_security_tls_inspection_policy.custom_tls_features
import data.terraform.helpers
import data.terraform.gcp.security.network_security.google_network_security_tls_inspection_policy.vars

conditions := [
  [
    {
      "situation_description" : "Custom TLS cipher suite list should not include known weak or deprecated ciphers",
      "remedies":[
        "Remove weak/deprecated cipher suites such as RC4 and 3DES from custom_tls_features"
      ]
    },
    {
      "condition": "c1 custom_tls_features does not include known-weak cipher suites",
      "attribute_path" : ["custom_tls_features"],
      "values" : ["TLS_RSA_WITH_RC4_128_SHA", "TLS_RSA_WITH_3DES_EDE_CBC_SHA"],
      "policy_type" : "blacklist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := helpers.get_multi_summary(conditions, vars.variables).details
