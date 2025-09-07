package terraform.gcp.security.binary_authorization.google_binary_authorization_policy.cluster_admission_rule

import data.terraform.gcp.helpers
import data.terraform.gcp.security.binary_authorization.google_binary_authorization_policy.vars

conditions := [
  [
    {
      "situation_description": "Cluster admission rule allows all images (ALWAYS_ALLOW)",
      "remedies": [
        "Use REQUIRE_ATTESTATION or at least enforce DENY for untrusted clusters"
      ]
    },
    {
      "condition": "Cluster admission rule must not be set to ALWAYS_ALLOW",
      "attribute_path": ["cluster_admission_rules", 0, "evaluation_mode"],
      "values": ["ALWAYS_ALLOW"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
