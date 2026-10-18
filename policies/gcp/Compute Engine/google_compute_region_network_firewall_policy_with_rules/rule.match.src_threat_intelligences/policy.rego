package terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_with_rules.rule_match_src_threat_intelligences
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_with_rules.vars as vars


conditions := [
  [
    {
      "situation_description": "Firewall rules must check source traffic against Google Network Threat Intelligence",
      "remedies": [
        "Set src_threat_intelligences to at least one Google-managed threat intelligence list",
        "Pick the lists that fit the workload - the platform requires that threat intelligence is consulted, not which feed is chosen",
        "Ensure that when there is a match, the action is set to DENY so matched traffic is blocked."
      ]
    },
    {
      "condition": "src_threat_intelligences references at least one threat intelligence list",
      "attribute_path": ["rule", 0, "match", 0, "src_threat_intelligences"],
      "values": [null, []],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
