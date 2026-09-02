package terraform.gcp.security.network_security.google_network_security_tls_inspection_policy.custom_tls_features
import data.terraform.helpers
import data.terraform.gcp.security.network_security.google_network_security_tls_inspection_policy.vars

conditions := [
  [
    {
      "situation_description" : "Custom TLS cipher suite list should not include known weak or deprecated cryptographic algorithms",
      "remedies":[
        "Remove any cipher suite containing RC4, 3DES, DES, MD5, NULL, EXPORT, or anonymous key exchange from custom_tls_features"
      ]
    },
    {
      "condition": "c1 custom_tls_features does not contain any weak-crypto pattern",
      "attribute_path" : ["custom_tls_features"],
      "values" : ["RC4", "3DES", "DES", "MD5", "NULL", "EXPORT", "anon"],
      "policy_type" : "element blacklist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
