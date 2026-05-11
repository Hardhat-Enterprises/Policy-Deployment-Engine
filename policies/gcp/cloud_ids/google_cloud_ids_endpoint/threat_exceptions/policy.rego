package terraform.gcp.security.cloud_ids.google_cloud_ids_endpoint.threat_exceptions

import data.terraform.helpers
import data.terraform.gcp.security.cloud_ids.google_cloud_ids_endpoint.vars

conditions := [
  [
    {
      "situation_description": "Threat exceptions include unsafe wildcard values",
      "remedies": ["Remove wildcard (*) or broad exceptions"]
    },
    {
      "condition": "Wildcard threat exception detected",
      "attribute_path": ["threat_exceptions"],
      "values": ["*", "all"],
      "policy_type": "element blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details