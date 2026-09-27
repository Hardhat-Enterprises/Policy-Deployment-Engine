package terraform.gcp.security.compute_engine.google_compute_network_firewall_policy_rule.match_src_threat_intelligences
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_network_firewall_policy_rule.vars

conditions := [
    [
    {
      "situation_description": "the rule does not check source traffic against any Google threat intelligence list",
      "remedies": ["add at least one Google threat intelligence list to src_threat_intelligences"]
    },
    {
      "condition": "src_threat_intelligences references at least one threat intelligence list",
      "attribute_path": ["match", 0, "src_threat_intelligences"],
      "values": [null, []],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details