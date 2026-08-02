package terraform.gcp.security.compute_engine.google_compute_network_firewall_policy_rule.security_profile_group
import data.terraform.helpers 
import data.terraform.gcp.security.compute_engine.google_compute_network_firewall_policy_rule.vars

conditions := [
    [
    {
      "situation_description": "The rule sends traffic to a security profile group that is not on the organisation's approved list",
      "remedies": ["Point security_profile_group at an approved security profile group through out the link"]
    },
    {
      "condition": "security_profile_group is an approved profile group",
      "attribute_path": ["security_profile_group"],
    "values": ["https://networksecurity.googleapis.com/v1/projects/fake-project/locations/global/securityProfileGroups/approved-spg"],
    "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details