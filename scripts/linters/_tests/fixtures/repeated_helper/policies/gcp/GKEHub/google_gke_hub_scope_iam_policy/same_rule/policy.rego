package terraform.gcp.security.gke_hub.google_gke_hub_scope_iam_policy.same_rule
import data.terraform.helpers
import data.terraform.helpers.shared
import data.terraform.gcp.security.gke_hub.google_gke_hub_scope_iam_policy.vars

conditions := [
  [
    {
      "situation_description": "Scope IAM policy contains public or overly-broad principals",
      "remedies": ["Remove allUsers from the policy"]
    },
    {
      "condition": "same_rule must NOT include allUsers",
      "attribute_path": ["same_rule"],
      "values": ["{\"bindings\":[{\"members\":[\"allUsers\"]}]}"],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

# One rule, same call twice over the same locals: hoistable, and reported. This
# is the general case the rule catches beyond the message/details pair.
_describe(resource, attribute_path) := text if {
	text := sprintf("%v is %v", [
		shared.get_attribute_value(resource, attribute_path),
		shared.get_attribute_value(resource, attribute_path),
	])
}
