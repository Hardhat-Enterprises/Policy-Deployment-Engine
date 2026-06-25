package terraform.gcp.security.cloud_healthcare.google_healthcare_consent_store.enable_consent_create_on_update

import data.terraform.helpers
import data.terraform.gcp.security.cloud_healthcare.google_healthcare_consent_store.vars

conditions := [
  [
    {
      "situation_description": "Consent store has enable_consent_create_on_update set to true — PATCH becomes upsert breaking audit trail",
      "remedies": [
        "Set enable_consent_create_on_update to false",
        "This ensures PATCH requests only update existing consents, preserving the create/update audit trail"
      ]
    },
    {
      "condition": "Check if enable_consent_create_on_update is false",
      "attribute_path": ["enable_consent_create_on_update"],
      "values": [false],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details