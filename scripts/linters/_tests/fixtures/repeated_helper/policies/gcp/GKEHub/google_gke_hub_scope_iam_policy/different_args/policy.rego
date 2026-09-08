package terraform.gcp.security.gke_hub.google_gke_hub_scope_iam_policy.different_args
import data.terraform.helpers
import data.terraform.gcp.security.gke_hub.google_gke_hub_scope_iam_policy.vars

# Two calls to the same helper with DIFFERENT arguments. They compute different
# things, so there is nothing to hoist and the rule must stay silent.
conditions := [
  [
    {
      "situation_description": "Scope IAM policy contains public or overly-broad principals",
      "remedies": ["Remove allUsers from the policy"]
    },
    {
      "condition": "different_args must NOT include allUsers",
      "attribute_path": ["different_args"],
      "values": ["{\"bindings\":[{\"members\":[\"allUsers\"]}]}"],
      "policy_type": "blacklist"
    }
  ]
]

other_conditions := array.concat(conditions, [])

result := helpers.get_multi_summary(conditions, vars.variables)
other := helpers.get_multi_summary(other_conditions, vars.variables)

message := result.message
details := other.details
