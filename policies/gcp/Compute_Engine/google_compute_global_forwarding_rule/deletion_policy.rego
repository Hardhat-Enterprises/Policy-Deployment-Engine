package terraform.gcp.security.compute_engine.google_compute_global_forwarding_rule.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_global_forwarding_rule.vars

conditions := [
  [
    {
      "situation_description": "The forwarding rule can still be destroyed by Terraform.",
      "remedies": ["Set 'deletion_policy' to 'PREVENT' so an accidental 'terraform destroy'/'apply' can't delete the rule."]
    },
    {
      "condition": "'deletion_policy' must be 'PREVENT'",
      "attribute_path": ["deletion_policy"],
      "values": ["PREVENT"],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
