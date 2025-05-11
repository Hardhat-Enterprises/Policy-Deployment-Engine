package terraform.gcp.security.access_manager.service_perimeter.ingress_policies

import data.terraform.gcp.helpers
import data.terraform.gcp.security.access_manager.service_perimeter.ingress_policies.vars

conditions := [
  [
    {"situation_description": "Ingress policy allows external/public access",
     "remedies": ["Restrict identities to internal users only"]},
    {
      "condition": "Check if ingress_from identities are not public",
      "attribute_path": ["ingress_policies", 0, "ingress_from", "identities", 0],
      "values": ["@deakin.edu.au"],
      "policy_type": "pattern whitelist"
    }
  ],
  [
    {"situation_description": "Ingress to resources allows wildcard access",
     "remedies": ["Avoid using '*' and specify target resources"]},
    {
      "condition": "Disallow wildcard in ingress_to resources",
      "attribute_path": ["ingress_policies", 0, "ingress_to", "resources", 0],
      "values": ["*"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details