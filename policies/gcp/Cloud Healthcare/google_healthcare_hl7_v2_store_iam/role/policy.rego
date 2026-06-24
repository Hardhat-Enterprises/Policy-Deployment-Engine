package terraform.gcp.security.cloud_healthcare.google_healthcare_hl7_v2_store_iam.role

import data.terraform.helpers
import data.terraform.gcp.security.cloud_healthcare.google_healthcare_hl7_v2_store_iam.vars

conditions := [
  [
    {
      "situation_description": "HL7 V2 Store IAM role must not be a primitive role — violates least privilege for clinical messaging data access",
      "remedies": [
        "Replace primitive roles with a specific HL7 V2 store role",
        "Approved roles: roles/healthcare.hl7V2StoreViewer, roles/healthcare.hl7V2Ingest, roles/healthcare.hl7V2StoreAdmin"
      ]
    },
    {
      "condition":      "Check if role is not a primitive role",
      "attribute_path": ["role"],
      "values":         ["roles/owner", "roles/editor", "roles/viewer"],
      "policy_type":    "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
