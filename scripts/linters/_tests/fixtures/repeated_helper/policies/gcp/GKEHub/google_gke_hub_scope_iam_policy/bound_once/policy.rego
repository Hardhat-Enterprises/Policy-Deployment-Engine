package terraform.gcp.security.gke_hub.google_gke_hub_scope_iam_policy.bound_once
import data.terraform.helpers
import data.terraform.gcp.security.gke_hub.google_gke_hub_scope_iam_policy.vars

# The kit convention: one call, bound once, fields read off the binding.
conditions := [
  [
    {
      "situation_description": "Scope IAM policy contains public or overly-broad principals",
      "remedies": ["Remove allUsers from the policy"]
    },
    {
      "condition": "bound_once must NOT include allUsers",
      "attribute_path": ["bound_once"],
      "values": ["{\"bindings\":[{\"members\":[\"allUsers\"]}]}"],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
