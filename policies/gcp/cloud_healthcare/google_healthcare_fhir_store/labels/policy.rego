package terraform.gcp.security.cloud_healthcare.google_healthcare_fhir_store.labels

import data.terraform.helpers
import data.terraform.gcp.security.cloud_healthcare.google_healthcare_fhir_store.vars

conditions := [
  [
    {
      "situation_description": "FHIR Store 'environment' label is missing or not an approved value",
      "remedies": [
        "Set the 'environment' label to one of: dev, test, staging, prod"
      ]
    },
    {
      "condition":      "Check if environment label is in the approved allowlist",
      "attribute_path": ["labels", "environment"],
      "values":         ["dev", "test", "staging", "prod"],
      "policy_type":    "whitelist"
    }
  ],
  [
    {
      "situation_description": "FHIR Store 'owner' label is missing or empty",
      "remedies": [
        "Set the 'owner' label to identify the team responsible for this resource"
      ]
    },
    {
      "condition":      "Check if owner label is not null or empty",
      "attribute_path": ["labels", "owner"],
      "values":         [null, ""],
      "policy_type":    "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
