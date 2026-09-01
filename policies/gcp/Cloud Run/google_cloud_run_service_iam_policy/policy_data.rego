package terraform.gcp.security.cloud_run.google_cloud_run_service_iam_policy.policy_data

import data.terraform.helpers
import data.terraform.gcp.security.cloud_run.google_cloud_run_service_iam_policy.vars

# Merged policy for `policy_data` — 3 independent scenarios.
# policy_lint reports hard-coded-value on the address inside the JSON below, and
# the finding stands. policy_data is compared as a whole rendered IAM policy
# document; a pattern target is used as a regex, and a JSON document's { [ ] "
# characters are regex metacharacters, while roles/... contains a "/" that the
# "*" wildcard ([^/]+) cannot cross. The address is part of the document being
# matched, so a wildcard cannot replace it without the match failing.
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
  ],
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
  ],
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
