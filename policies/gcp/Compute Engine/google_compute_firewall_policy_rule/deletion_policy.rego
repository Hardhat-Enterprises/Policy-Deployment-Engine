package terraform.gcp.security.compute_engine.google_compute_firewall_policy_rule.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_firewall_policy_rule.vars

conditions := [
  [
    {
      "situation_description": "deletion_policy is set to ABANDON, which removes the firewall rule from Terraform management while leaving it active in GCP",
      "remedies": [
        "Set deletion_policy to DELETE or PREVENT so the firewall rule remains under Terraform lifecycle management"
      ]
    },
    {
      "condition": "deletion_policy must not be ABANDON",
      "attribute_path": ["deletion_policy"],
      "values": ["ABANDON"],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
