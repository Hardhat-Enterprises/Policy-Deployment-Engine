package terraform.gcp.security.gke_hub.google_gke_hub_feature_iam_binding.no_public_principals_binding
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_hub.google_gke_hub_feature_iam_binding.vars

conditions := [[
  {
    "situation_description": "IAM member grant uses a public principal",
    "remedies": ["Remove any public principals,use org service accounts"]
  },
  {
    "condition": "members[0] must NOT be public",
    "attribute_path": ["members", 0],
    "values": ["allUsers","allAuthenticatedUsers"],
    "policy_type": "blacklist"
  },
  {
    "condition": "members[1] must NOT be public",
    "attribute_path": ["members", 1],
    "values": ["allUsers","allAuthenticatedUsers"],
    "policy_type": "blacklist"
  }
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

