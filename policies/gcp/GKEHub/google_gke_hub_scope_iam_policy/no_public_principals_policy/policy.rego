package terraform.gcp.security.gke_hub.google_gke_hub_scope_iam_policy.no_public_principals_policy
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_hub.google_gke_hub_scope_iam_policy.vars

conditions := [
  [
    {
      "situation_description": "Scope IAM policy contains public or overly-broad principals",
      "remedies": ["Remove allUsers from the policy" ]
    },
    {
  "condition": "policy_data must NOT include allUsers",
  "attribute_path": ["policy_data"],
  "values": ["{\"bindings\":[{\"members\":[\"allUsers\"],\"role\":\"roles/gkehub.viewer\"}]}"],
  "policy_type": "blacklist"
}
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
