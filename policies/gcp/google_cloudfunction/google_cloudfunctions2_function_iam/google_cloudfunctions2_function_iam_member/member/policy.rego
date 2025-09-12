package terraform.gcp.security.google_cloudfunction.google_cloudfunctions2_function_iam.member

import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_cloudfunction.google_cloudfunctions2_function_iam.google_cloudfunctions2_function_iam_member.vars

conditions := [
 [
    {
      "situation_description": "IAM member grants public access to the Cloud Function.",
      "remedies": [
        "Avoid using 'allUsers' or 'allAuthenticatedUsers' as IAM members.",
        "Restrict access to specific identities or service accounts."
      ]
    },
    {
      "condition": "IAM member must not be publicly accessible.",
      "attribute_path": ["member"],
      "values": ["allUsers", "allAuthenticatedUsers"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details