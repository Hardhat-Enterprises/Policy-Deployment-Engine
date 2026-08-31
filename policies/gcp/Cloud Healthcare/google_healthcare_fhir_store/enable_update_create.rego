package terraform.gcp.security.cloud_healthcare.google_healthcare_fhir_store.enable_update_create

import data.terraform.helpers
import data.terraform.gcp.security.cloud_healthcare.google_healthcare_fhir_store.vars

conditions := [
  [
    {
      "situation_description": "FHIR Store has enable_update_create set to true — allows client-specified IDs that may contain sensitive patient identifiers",
      "remedies": [
        "Set enable_update_create to false",
        "This ensures all IDs are server-assigned, preventing patient identifiers from appearing in audit logs and Pub/Sub notifications"
      ]
    },
    {
      "condition":      "Check if enable_update_create is false",
      "attribute_path": ["enable_update_create"],
      "values":         [false],
      "policy_type":    "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
