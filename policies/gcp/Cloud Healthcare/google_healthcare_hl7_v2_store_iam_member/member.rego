package terraform.gcp.security.cloud_healthcare.google_healthcare_hl7_v2_store_iam_member.member

import data.terraform.helpers
import data.terraform.gcp.security.cloud_healthcare.google_healthcare_hl7_v2_store_iam_member.vars

conditions := [
  [
    {
      "situation_description": "HL7 V2 Store IAM member must not be allUsers or allAuthenticatedUsers — grants public access to clinical messaging data",
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

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
