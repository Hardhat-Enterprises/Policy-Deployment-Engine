package terraform.gcp.security.compute_engine.google_compute_region_backend_service.security_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_backend_service.vars

conditions := [
  [
    {
      "situation_description": "No Cloud Armor security policy is attached to the backend service.",
      "remedies": ["Set 'security_policy' to an existing Cloud Armor security policy."]
    },
    {
      "condition": "'security_policy' must be set",
      "attribute_path": ["security_policy"],
      "values": ["", null],
      "policy_type": "blacklist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
