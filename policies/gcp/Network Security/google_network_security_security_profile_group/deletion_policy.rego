package terraform.gcp.security.network_security.google_network_security_security_profile_group.deletion_policy
import data.terraform.helpers
import data.terraform.gcp.security.network_security.google_network_security_security_profile_group.vars

conditions := [
  [
    {
      "situation_description" : "Security profile group should be protected from accidental deletion",
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
details := helpers.get_multi_summary(conditions, vars.variables).details
