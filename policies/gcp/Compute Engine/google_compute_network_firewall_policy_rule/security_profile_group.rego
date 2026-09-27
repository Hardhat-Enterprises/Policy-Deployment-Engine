package terraform.gcp.security.compute_engine.google_compute_network_firewall_policy_rule.security_profile_group
import data.terraform.helpers 
import data.terraform.gcp.security.compute_engine.google_compute_network_firewall_policy_rule.vars

conditions := [
    [
    {
      "situation_description": "No security profile group is set, so traffic routed for inspection has no profile to inspect it against",
      "remedies": ["Set security_profile_group to the security profile group that should inspect this traffic"]
    },
    {
      "condition": "security_profile_group is set",
      "attribute_path": ["security_profile_group"],
      "values": [null, ""],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details