package terraform.gcp.security.cloud_healthcare.google_healthcare_dataset_iam.member

import data.terraform.helpers
import data.terraform.gcp.security.cloud_healthcare.google_healthcare_dataset_iam.vars

conditions := [
  [
    {
      "situation_description": "Dataset IAM member must not be allUsers or allAuthenticatedUsers — exposes all stores (FHIR, DICOM, HL7v2, Consent) to public access",
      "remedies": [
        "Replace 'allUsers' or 'allAuthenticatedUsers' with a specific service account, user, or group",
        "Example: serviceAccount:my-sa@my-project.iam.gserviceaccount.com"
      ]
    },
    {
      "condition":      "Check if member is not a public identity",
      "attribute_path": ["member"],
      "values":         ["allUsers", "allAuthenticatedUsers"],
      "policy_type":    "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
