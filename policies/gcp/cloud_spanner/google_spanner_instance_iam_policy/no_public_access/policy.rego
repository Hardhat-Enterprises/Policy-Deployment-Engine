package terraform.gcp.security.cloud_spanner.google_spanner_instance_iam_policy.no_public_access
import data.terraform.helpers
import data.terraform.gcp.security.cloud_spanner.google_spanner_instance_iam_policy.vars
conditions := [
  [
    {
      "situation_description": "Cloud Spanner instance IAM policy grants access to allUsers or allAuthenticatedUsers, making the instance publicly accessible.",
      "remedies": [
        "Remove allUsers and allAuthenticatedUsers from the policy bindings and grant access only to specific identities."
      ]
    },
    {
      "condition": "policy_data must not contain allUsers or allAuthenticatedUsers",
      "attribute_path": ["policy_data"],
      "values": ["{\"bindings\":[{\"members\":[\"allUsers\"],\"role\":\"roles/spanner.viewer\"}]}"],
      "policy_type": "blacklist"
    }
  ]
]
summary := helpers.get_multi_summary(conditions, vars.variables)
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
