package terraform.gcp.security.cloud_run.google_cloud_run_service_iam.role

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service_iam.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service IAM policy grants an overly privileged role",
      "remedies": [
        "Use a least-privilege role such as roles/viewer",
        "Avoid granting roles/run.admin, roles/editor, or roles/owner unless strictly required"
      ]
    },
    {
      "condition": "IAM policy data must not contain overly privileged roles",
      "attribute_path": ["policy_data"],
      "values": [
        "{\"bindings\":[{\"members\":[\"user:jane@example.com\"],\"role\":\"roles/run.admin\"}]}",
        "{\"bindings\":[{\"members\":[\"user:jane@example.com\"],\"role\":\"roles/editor\"}]}",
        "{\"bindings\":[{\"members\":[\"user:jane@example.com\"],\"role\":\"roles/owner\"}]}"
      ],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

