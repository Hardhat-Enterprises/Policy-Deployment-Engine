package terraform.gcp.security.compute_engine.google_compute_firewall_policy_rule.deletion_policy
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_firewall_policy_rule.vars

conditions := [
  [
    {
      "situation_description": "deletion_policy is not set to PREVENT, which allows this firewall rule to be destroyed via Terraform",
      "remedies": [
        "Set deletion_policy to PREVENT to block destructive deletion of this rule"
      ]
    },
    {
      "condition": "deletion_policy must be PREVENT",
      "attribute_path": ["deletion_policy"],
      "policy_type": "whitelist",
      "values": ["PREVENT"]
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
