package terraform.gcp.security.gke_hub.google_gke_hub_feature_membership.configmanagement_config_sync_git_https_proxy
import data.terraform.helpers
import data.terraform.gcp.security.gke_hub.google_gke_hub_feature_membership.vars

conditions := [
  [
    {
      "situation_description": "Git repo access is not routed through an approved HTTPS proxy",
      "remedies": ["Use approved organizational proxy" ]
    },
    {
      "condition": "https_proxy must match approved list",
      "attribute_path": ["configmanagement",0,"config_sync",0,"git",0,"https_proxy"],
      "values": ["https://proxy.yourcompany.com"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

