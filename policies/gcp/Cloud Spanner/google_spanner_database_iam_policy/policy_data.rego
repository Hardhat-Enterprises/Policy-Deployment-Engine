package terraform.gcp.security.cloud_spanner.google_spanner_database_iam_policy.policy_data
import data.terraform.helpers
import data.terraform.gcp.security.cloud_spanner.google_spanner_database_iam_policy.vars
conditions := [
  [
    {
      "situation_description": "Cloud Spanner database IAM policy grants access to allUsers or allAuthenticatedUsers, making the database publicly accessible.",
      "remedies": [
        "Remove allUsers and allAuthenticatedUsers from the policy bindings and grant access only to specific identities."
      ]
    },
    {
      "condition": "policy_data must not contain allUsers or allAuthenticatedUsers",
      "attribute_path": ["policy_data"],
      "values": ["{\"bindings\":[{\"members\":[\"allUsers\"],\"role\":\"roles/spanner.databaseReader\"}]}"],
      "policy_type": "blacklist"
    }
  ]
]
summary := helpers.get_multi_summary(conditions, vars.variables)
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
