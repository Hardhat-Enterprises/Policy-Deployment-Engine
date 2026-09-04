package terraform.gcp.security.cloud_healthcare.google_healthcare_fhir_store.version

import data.terraform.helpers
import data.terraform.gcp.security.cloud_healthcare.google_healthcare_fhir_store.vars

conditions := [
  [
    {
      "situation_description": "FHIR Store is not using an approved FHIR version — DSTU2 is deprecated and not approved for production",
      "remedies": [
        "Set version to an approved FHIR version: R4 or STU3",
        "Example: version = \"R4\""
      ]
    },
    {
      "condition":      "Check if version is in the approved allowlist",
      "attribute_path": ["version"],
      "values":         ["R4", "STU3"],
      "policy_type":    "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
