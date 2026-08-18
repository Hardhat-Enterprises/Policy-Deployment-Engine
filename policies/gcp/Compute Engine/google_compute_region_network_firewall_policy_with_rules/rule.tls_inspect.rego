package terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_with_rules.rule_tls_inspect
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_with_rules.vars


conditions := [
  [
    {
      "situation_description": "TLS Inspection needs to be set to true so that IDS (Intrusion Detection Systems) and Firewall rules matching on Network Threat Intelligence can inspect the traffic.",
      "remedies": [
        "Ensure that tls_inspect is set to TRUE when Network Threat Intelligence is used."
      ]
    },
    {
      "condition": "TLS Inspection must be set to true.",
      "attribute_path": ["rule", 0, "tls_inspect"],
      "values": [TRUE],
      "policy_type": "whitelist"
    }
  ]
]

   
result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details