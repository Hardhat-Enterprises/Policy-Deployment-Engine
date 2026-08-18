package terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_with_rules.deletion_policy
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_with_rules.vars


conditions := [
  [
    {
      "situation_description": "DatasetConfig should use a dedicated per-config identity",
      "remedies": [
        "Use IDENTITY_TYPE_PER_CONFIG to reduce shared identity risk"
      ]
    },
    {
      "condition": "Identity type must be per config",
      "attribute_path": ["identity", 0, "type"],
      "values": ["IDENTITY_TYPE_PER_CONFIG"],
      "policy_type": "whitelist"
    }
  ]
]

   
   
result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details