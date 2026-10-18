package terraform.gcp.security.cloud_healthcare.google_healthcare_hl7_v2_store.reject_duplicate_message

import data.terraform.helpers
import data.terraform.gcp.security.cloud_healthcare.google_healthcare_hl7_v2_store.vars

conditions := [
  [
    {
      "situation_description": "HL7 V2 Store does not reject duplicate messages — may cause duplicate clinical events and data integrity issues",
      "remedies": [
        "Set reject_duplicate_message to true",
        "This ensures duplicate HL7 V2 messages are rejected, preventing duplicate clinical events"
      ]
    },
    {
      "condition":      "Check if reject_duplicate_message is true",
      "attribute_path": ["reject_duplicate_message"],
      "values":         [true],
      "policy_type":    "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
