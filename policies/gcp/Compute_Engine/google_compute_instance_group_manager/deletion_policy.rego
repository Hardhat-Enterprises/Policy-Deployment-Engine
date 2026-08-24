package terraform.gcp.security.compute_engine.google_compute_instance_group_manager.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_instance_group_manager.vars

conditions := [
  [
    {
      "situation_description": "The instance group manager can still be destroyed by Terraform.",
      "remedies": ["Set 'deletion_policy' to 'PREVENT' so an accidental 'terraform destroy'/'apply' can't delete the group."]
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
