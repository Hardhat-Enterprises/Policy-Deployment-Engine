package terraform.gcp.security.network_security.google_network_security_tls_inspection_policy.min_tls_version
import data.terraform.helpers
import data.terraform.gcp.security.network_security.google_network_security_tls_inspection_policy.vars

conditions := [
  [
    {
      "situation_description" : "TLS inspection should enforce a modern minimum TLS version",
      "remedies":[
        "Set min_tls_version to TLS_1_2 or TLS_1_3"
      ]
    },
    {
      "condition": "c1 min_tls_version is TLS_1_2 or TLS_1_3",
      "attribute_path" : ["min_tls_version"],
      "values" : ["TLS_1_2", "TLS_1_3"],
      "policy_type" : "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := helpers.get_multi_summary(conditions, vars.variables).details
