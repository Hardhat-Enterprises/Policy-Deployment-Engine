package terraform.gcp.security.compute_engine.google_compute_firewall_policy_rule.tls_inspect

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_firewall_policy_rule.vars

conditions := [
  [
    {
      "situation_description": "TLS inspection is not enabled when a security profile group is applied",
      "remedies": [
        "Set tls_inspect to true when action is apply_security_profile_group"
      ]
    },
    {
      "condition": "tls_inspect must be true",
      "attribute_path": ["tls_inspect"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

applicable_resources := [r |
    r := input.planned_values.root_module.resources[_]
    r.type == "google_compute_firewall_policy_rule"
    r.values.action == "apply_security_profile_group"
]

filtered_input := {
    "planned_values": {
        "root_module": {
            "resources": applicable_resources
        }
    }
}

result := r if {
    r := helpers.get_multi_summary(conditions, vars.variables) with input as filtered_input
}

message := result.message
details := result.details
