package terraform.gcp.security.cloud_healthcare.google_healthcare_dataset.location

import data.terraform.helpers
import data.terraform.gcp.security.cloud_healthcare.google_healthcare_dataset.vars

conditions := [
  [
    {
      "situation_description": "Healthcare Dataset is not deployed in an approved location — PHI data residency requirement violated",
      "remedies": [
        "Set location to one of the approved regions: us-central1, us-east1, us-east4, australia-southeast1, australia-southeast2"
      ]
    },
    {
      "condition":      "Check if location is in the approved allowlist",
      "attribute_path": ["location"],
      "values":         ["us-central1", "us-east1", "us-east4", "australia-southeast1", "australia-southeast2"],
      "policy_type":    "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
