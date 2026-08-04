package terraform.gcp.security.network_security.google_network_security_client_tls_policy.location
import data.terraform.helpers
import data.terraform.gcp.security.network_security.google_network_security_client_tls_policy.vars

conditions := [
  [
    {
      "situation_description" : "Client TLS policy should be within an approved Australian region",
      "remedies":[
        "Use an approved Australian region for the client TLS policy"
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
details := helpers.get_multi_summary(conditions, vars.variables).details
