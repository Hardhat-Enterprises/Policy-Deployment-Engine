package terraform.gcp.security.network_security.google_network_security_gateway_security_policy_rule.tls_inspection_enabled
import data.terraform.helpers
import data.terraform.gcp.security.network_security.google_network_security_gateway_security_policy_rule.vars

conditions := [
  [
    {
      "situation_description" : "TLS inspection should be enabled so encrypted traffic matching this rule is actually inspected",
      "remedies":[
        "Set tls_inspection_enabled to true"
      ]
    },
    {
      "condition": "c1 tls_inspection_enabled is true",
      "attribute_path" : ["tls_inspection_enabled"],
      "values" : [true],
      "policy_type" : "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := helpers.get_multi_summary(conditions, vars.variables).details
