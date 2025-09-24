package terraform.gcp.security.gke_hub.google_gke_hub_scope_iam_member.no_public_principals_member
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_hub.google_gke_hub_scope_iam_member.vars

conditions := [
  [
    {
      "situation_description": "Scope IAM member uses a public or overly-broad principal",
      "remedies": ["Replace with an account from your org; avoid allUsers/allAuthenticatedUsers/project*"]
    },
    {
      "condition": "member must NOT be public/broad",
      "attribute_path": ["member"],
      "values": ["allUsers","allAuthenticatedUsers","projectOwner:","projectEditor:","projectViewer:"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

