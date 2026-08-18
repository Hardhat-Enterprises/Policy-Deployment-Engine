package terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_with_rules.deletion_policy
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_with_rules.vars


conditions := [
  [
    {
      "situation_description": "Firewall policy must enable deletion protection.",
      "remedies": ["Set deletion_policy to PREVENT to avoid accidental deletion of firewall rules."]
    },
    {
      "condition": "Deletion protection not enabled",
      "attribute_path": ["deletion_policy"],
      "values": ["PREVENT"],
      "policy_type": "whitelist"
    }
  ]
]
   
result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details