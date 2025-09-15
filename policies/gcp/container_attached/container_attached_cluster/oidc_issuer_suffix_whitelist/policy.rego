package terraform.gcp.security.container_attached.container_attached_cluster.oidc_issuer_suffix_whitelist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.container_attached.container_attached_cluster.vars

conditions := [
  [
    {
      "situation_description": "OIDC issuer URL is outside approved identity domains.",
      "remedies": ["Use issuer URLs ending with '.oidc.corp.example.com' only."]
    },
    {
      "condition": "OIDC issuer must end with approved suffix",
      "attribute_path": ["oidc_config", 0 , "issuer_url"],
      "values": [".oidc.corp.example.com"],
      "policy_type": "suffix_whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
