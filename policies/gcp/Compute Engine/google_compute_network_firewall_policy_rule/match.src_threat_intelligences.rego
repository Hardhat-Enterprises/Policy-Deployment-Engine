package terraform.gcp.security.compute_engine.google_compute_network_firewall_policy_rule.match_src_threat_intelligences
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_network_firewall_policy_rule.vars

conditions := [
    [
    {
      "situation_description": "the rule targets a source region that is outside the approved list",
      "remedies": ["filter the src_threat_intelligences to regions"]
    },
    {
      "condition": "src_threat_intelligences contains a unrestricted region",
      "attribute_path": ["match", 0, "src_threat_intelligences"],
      "values": ["iplist-known-malicious-ips"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details