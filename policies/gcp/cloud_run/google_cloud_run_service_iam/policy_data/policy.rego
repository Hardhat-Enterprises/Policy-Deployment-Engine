package terraform.gcp.security.cloud_run.google_cloud_run_service_iam.policy_data

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service_iam.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service IAM policy allows public access",
      "remedies": [
        "Remove allUsers or allAuthenticatedUsers from the IAM policy",
        "Grant access only to approved users, groups, or service accounts"
      ]
    },
    {
      "condition": "IAM policy data must not allow public access",
      "attribute_path": ["policy_data"],
      "values": [
        "{\"bindings\":[{\"members\":[\"allUsers\"],\"role\":\"roles/viewer\"}]}",
        "{\"bindings\":[{\"members\":[\"allAuthenticatedUsers\"],\"role\":\"roles/viewer\"}]}"
      ],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

