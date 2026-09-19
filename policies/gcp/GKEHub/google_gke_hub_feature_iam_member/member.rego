package terraform.gcp.security.gke_hub.google_gke_hub_feature_iam_member.member
import data.terraform.helpers
import data.terraform.gcp.security.gke_hub.google_gke_hub_feature_iam_member.vars



conditions := [
  [
    {
      "situation_description": "IAM member grant uses a public or overly-broad principal",
      "remedies": ["Replace with a group or service account from your domain" ]
    },
    {
      "condition": "member must NOT be public/broad",
      "attribute_path": ["member"],
      "values":["allUsers"],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
