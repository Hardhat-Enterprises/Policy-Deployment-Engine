package terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_with_rules.rule_match_src_threat_intelligences
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_with_rules.vars as vars


conditions := [
  [
    {
      "situation_description": "Firewall rules matching on Network Threat Intelligence must reference approved threat lists, not general categorisation lists",
      "remedies": [
        "Use threat-oriented lists such as iplist-known-malicious-ips or iplist-tor-exit-nodes",
        "Remove generic catagorisation lists which dont usually indicate malicious traffic",
        "Ensure that when there is a match, the action is set to DENY so matched traffic is blocked."
      ]
    },
    {
      "condition": "Check that source threat intelligence lists are within the approved set",
      "attribute_path": ["rule", 0, "match", 0, "src_threat_intelligences"],
      "values": ["iplist-known-malicious-ips", "iplist-tor-exit-nodes"],
      "policy_type": "whitelist"
    }
  ]
]
   
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
