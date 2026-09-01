package terraform.gcp.security.discovery_engine.google_discovery_engine_control.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_control.vars

# Prevent accidental deletion of production controls.

conditions := [
  [
    {
      "situation_description": "Is the Discovery Engine control protected against accidental deletion?",
      "remedies": ["Set deletion_policy to PREVENT for production resources."]
    },
    {
      "condition": "deletion_policy is not configured securely",
      "attribute_path": ["deletion_policy"],
      "values": ["PREVENT"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details