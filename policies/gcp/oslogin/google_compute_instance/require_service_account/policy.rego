package terraform.gcp.security.oslogin.google_compute_instance.require_service_account

import data.terraform.gcp.helpers
import data.terraform.gcp.security.oslogin.google_compute_instance.vars

# --- Conditions ---
conditions := [
  [
    {
      "situation_description": "Instances with OS Login must use a service account",
      "remedies": [
        "Attach a valid service account to the instance",
        "Ensure service_account block is not empty"
      ]
    },
    {
      "condition": "Check service_account block is defined",
      "attribute_path": ["service_account"],
      "values": [null],        # non-null required
      "policy_type": "whitelist"
    }
  ]
]

# --- Outputs ---
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
