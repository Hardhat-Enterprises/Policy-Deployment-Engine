package terraform.gcp.security.gke_hub.google_gke_hub_scope_iam_policy.rule_locals
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
      "condition": "rule_locals must NOT include allUsers",
      "attribute_path": ["rule_locals"],
      "values": ["{\"bindings\":[{\"members\":[\"allUsers\"]}]}"],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

# Two *different* rules whose call text is identical but whose `resource` and
# `attribute_path` are each rule's own parameters. Nothing can be hoisted out of
# these, so the rule must not report them — this is the shape policies/_helpers
# genuinely uses.
_first_value(resource, attribute_path) := value if {
	value := shared.get_attribute_value(resource, attribute_path)
}

_second_value(resource, attribute_path) := value if {
	value := shared.get_attribute_value(resource, attribute_path)
}
