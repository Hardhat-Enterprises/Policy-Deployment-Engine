package terraform.gcp.security.gke_hub.google_gke_hub_feature_membership.git_secure_auth
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gke_hub.google_gke_hub_feature_membership.vars


conditions := [
  [
    {
      "situation_description": "Git ConfigSync must be secure secret type AND an approved GCP Service Account",
      "remedies": [ "Make sure to use a gcpserviceaccount/gcenode and Ensure email matches an approved service account"]
    },
    {
      "condition": "c1 secret_type must be secure ",
      "attribute_path": ["configmanagement",0,"config_sync",0,"git",0,"secret_type"],
      "values": ["gcpserviceaccount","gcenode"],
      "policy_type": "whitelist"
    },
    {
      "condition": "c2 service account must be from approved organisation",
      "attribute_path": ["configmanagement",0,"config_sync",0,"git",0,"gcp_service_account_email"],
      "values": ["example@orgdomain.com"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

