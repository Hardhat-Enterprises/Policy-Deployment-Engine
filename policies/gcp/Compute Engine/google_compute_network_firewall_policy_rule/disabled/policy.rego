package terraform.gcp.security.compute_engine.google_compute_network_firewall_policy_rule.disabled
import data.terraform.helpers 
import data.terraform.gcp.security.compute_engine.google_compute_network_firewall_policy_rule.vars

conditions := [
    [
    {
      "situation_description": "The firewall policy rule is disabled, the request get through without getting unspecified",
      "remedies": ["Set disabled to false so the firewall policy rule will be enabled"]
    },
    {
      "condition": "set the request unspecified",
      "attribute_path": ["disabled"],
      "values": [false],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details