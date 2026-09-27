package terraform.gcp.security.gke_hub.google_gke_hub_feature_iam_binding.members
import data.terraform.helpers
import data.terraform.gcp.security.gke_hub.google_gke_hub_feature_iam_binding.vars

conditions := [[
  {
    "situation_description": "IAM member grant uses a public principal",
    "remedies": ["Remove any public principals,use org service accounts"]
  },
  {
    "condition": "no member may be public",
    "attribute_path": ["members"],
    "values": ["allUsers","allAuthenticatedUsers"],
    "policy_type": "blacklist"
  }
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

