package terraform.gcp.security.network_security.google_network_security_client_tls_policy.deletion_policy
import data.terraform.helpers
import data.terraform.gcp.security.network_security.google_network_security_client_tls_policy.vars

conditions := [
  [
    {
      "situation_description" : "Client TLS policy should be protected from accidental deletion",
      "remedies":[
        "Set deletion_policy to PREVENT"
      ]
    },
    {
      "condition": "c1 deletion_policy is PREVENT",
      "attribute_path" : ["deletion_policy"],
      "values" : ["PREVENT"],
      "policy_type" : "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
