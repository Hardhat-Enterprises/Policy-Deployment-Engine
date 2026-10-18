package terraform.gcp.security.network_security.google_network_security_gateway_security_policy_rule.enabled
import data.terraform.helpers
import data.terraform.gcp.security.network_security.google_network_security_gateway_security_policy_rule.vars

conditions := [
  [
    {
      "situation_description" : "Gateway security policy rule should be actively enforced, not silently disabled",
      "remedies":[
        "Set enabled to true"
      ]
    },
    {
      "condition": "c1 enabled is true",
      "attribute_path" : ["enabled"],
      "values" : [true],
      "policy_type" : "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
