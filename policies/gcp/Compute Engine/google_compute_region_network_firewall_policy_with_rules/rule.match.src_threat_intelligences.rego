package terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_with_rules.rule_match_src_threat_intelligences
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_with_rules.vars


conditions := [
  [
    {
      "situation_description": "INCLUDE SITUATION DESCRIPTION",
      "remedies": [
        "INCLUDE remedies DESCRIPTION"
      ]
    },
    {
      "condition": "CONDITIONS",
      "attribute_path": ["PATH", 0, "TO_ATTRIBUTE"],
      "values": ["EXAMPLE_VALUE"],
      "policy_type": "whitelist"
    }
  ]
]

   
result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details