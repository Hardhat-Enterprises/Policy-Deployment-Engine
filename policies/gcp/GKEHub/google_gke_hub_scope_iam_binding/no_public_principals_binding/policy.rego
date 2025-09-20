package terraform.gcp.security.gke_hub.google_gke_hub_scope_iam_binding.no_public_principals_binding
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_hub.google_gke_hub_scope_iam_binding.vars

conditions := [
  [
    {
      "situation_description": "Scope IAM binding grants access to public or overly-broad principals",
      "remedies": ["Remove public/broad principals like allUsers/allAuthenticatedUsers/project*"]
    },
    {
      "condition": "members[0] must NOT be public/broad",
      "attribute_path": ["members", 0],
      "values": ["allUsers", "allAuthenticatedUsers"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

