package terraform.gcp.security.cloud_healthcare.google_healthcare_consent_store_iam_member.role

import data.terraform.helpers
import data.terraform.gcp.security.cloud_healthcare.google_healthcare_consent_store_iam_member.vars

conditions := [
  [
    {
      "situation_description": "Consent Store IAM role must not be a primitive role — violates least privilege for PHI access",
      "remedies": [
        "Replace primitive roles with a specific healthcare role",
        "Approved roles: roles/healthcare.consentStoreViewer, roles/healthcare.consentStoreEditor, roles/healthcare.consentStoreAdmin"
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
