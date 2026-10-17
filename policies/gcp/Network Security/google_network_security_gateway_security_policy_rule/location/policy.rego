package terraform.gcp.security.network_security.google_network_security_gateway_security_policy_rule.location
import data.terraform.helpers
import data.terraform.gcp.security.network_security.google_network_security_gateway_security_policy_rule.vars

conditions := [
  [
    {
      "situation_description" : "Gateway security policy rule should be within an approved Australian region",
      "remedies":[
        "Use an approved Australian region for the gateway security policy rule"
      ]
    },
    {
      "condition": "c1 location is either australia-southeast1 or australia-southeast2",
      "attribute_path" : ["location"],
      "values" : ["AUSTRALIA-SOUTHEAST1", "AUSTRALIA-SOUTHEAST2"],
      "policy_type" : "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
