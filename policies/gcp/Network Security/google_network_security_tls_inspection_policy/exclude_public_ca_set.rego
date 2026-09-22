package terraform.gcp.security.network_security.google_network_security_tls_inspection_policy.exclude_public_ca_set
import data.terraform.helpers
import data.terraform.gcp.security.network_security.google_network_security_tls_inspection_policy.vars

conditions := [
  [
    {
      "situation_description" : "TLS interception should rely on explicit trust anchors rather than the broad, externally-managed public CA set",
      "remedies":[
        "Set exclude_public_ca_set to true"
      ]
    },
    {
      "condition": "c1 exclude_public_ca_set is true",
      "attribute_path" : ["exclude_public_ca_set"],
      "values" : [true],
      "policy_type" : "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
