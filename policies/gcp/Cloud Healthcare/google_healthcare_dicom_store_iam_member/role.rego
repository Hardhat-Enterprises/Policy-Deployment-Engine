package terraform.gcp.security.cloud_healthcare.google_healthcare_dicom_store_iam_member.role

import data.terraform.helpers
import data.terraform.gcp.security.cloud_healthcare.google_healthcare_dicom_store_iam_member.vars

conditions := [
  [
    {
      "situation_description": "DICOM Store IAM role must not be a primitive role — violates least privilege for medical imaging data access",
      "remedies": [
        "Replace primitive roles with a specific DICOM store role",
        "Approved roles: roles/healthcare.dicomStoreViewer, roles/healthcare.dicomEditor, roles/healthcare.dicomStoreAdmin"
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
