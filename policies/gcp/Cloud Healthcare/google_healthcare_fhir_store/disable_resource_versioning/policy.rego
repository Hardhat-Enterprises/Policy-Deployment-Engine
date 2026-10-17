package terraform.gcp.security.cloud_healthcare.google_healthcare_fhir_store.disable_resource_versioning

import data.terraform.helpers
import data.terraform.gcp.security.cloud_healthcare.google_healthcare_fhir_store.vars

conditions := [
  [
    {
      "situation_description": "FHIR Store has resource versioning disabled — historical versions not retained, breaking audit trail",
      "remedies": [
        "Set disable_resource_versioning to false",
        "This ensures all write operations retain historical versions for audit and compliance"
      ]
    },
    {
      "condition":      "Check if disable_resource_versioning is false",
      "attribute_path": ["disable_resource_versioning"],
      "values":         [false],
      "policy_type":    "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
