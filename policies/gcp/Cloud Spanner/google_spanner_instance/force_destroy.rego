package terraform.gcp.security.cloud_spanner.google_spanner_instance.force_destroy

import data.terraform.helpers
import data.terraform.gcp.security.cloud_spanner.google_spanner_instance.vars

conditions := [
  [
    {
      "situation_description": "Cloud Spanner instance has force_destroy enabled, allowing the instance to be destroyed even if it contains databases.",
      "remedies": [
        "Set force_destroy = false on the instance to prevent accidental destruction."
      ]
    },
    {
      "condition": "force_destroy must be false",
      "attribute_path": ["force_destroy"],
      "values": [false],
      "policy_type": "whitelist"
    }
  ]
]

summary := result

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
