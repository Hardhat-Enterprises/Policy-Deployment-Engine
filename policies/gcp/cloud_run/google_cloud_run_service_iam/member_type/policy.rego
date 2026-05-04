package terraform.gcp.security.cloud_run.google_cloud_run_service_iam.member_type

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service_iam.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service IAM policy grants access to a broad or risky member type",
      "remedies": [
        "Use specific users, groups, or service accounts",
        "Avoid broad identities such as allUsers, allAuthenticatedUsers, domain, projectOwner, or projectEditor"
      ]
    },
    {
      "condition": "IAM policy data must not contain broad member types",
      "attribute_path": ["policy_data"],
      "values": [
        "{\"bindings\":[{\"members\":[\"allUsers\"],\"role\":\"roles/viewer\"}]}",
        "{\"bindings\":[{\"members\":[\"allAuthenticatedUsers\"],\"role\":\"roles/viewer\"}]}",
        "{\"bindings\":[{\"members\":[\"domain:example.com\"],\"role\":\"roles/viewer\"}]}",
        "{\"bindings\":[{\"members\":[\"projectOwner:my-gcp-project\"],\"role\":\"roles/viewer\"}]}",
        "{\"bindings\":[{\"members\":[\"projectEditor:my-gcp-project\"],\"role\":\"roles/viewer\"}]}"
      ],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details