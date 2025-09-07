package terraform.gcp.security.gke_hub.google_gke_hub_feature_iam_binding.no_public_principals_binding
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_hub.google_gke_hub_feature_iam_binding.vars


conditions := [[
  {
    "situation_description": "IAM member grant uses a public principal",
    "remedies": [
      "Remove allUsers/allAuthenticatedUsers, use an account from your org domain"]
  },
  {
    "condition": "c1 members must NOT be allUser",
    "attribute_path": ["members", 0],
    "values": ["allUsers"],
    "policy_type": "blacklist"
  },
  {
    "condition": "c2 members must NOT be allAuthenticatedUsers",
    "attribute_path": ["members", 1],
    "values": ["allAuthenticatedUsers"],
    "policy_type": "blacklist"
  }
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

