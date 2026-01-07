package terraform.gcp.security.beyondcorp.google_beyondcorp_app_gateway.host_type_whitelist

import data.terraform.helpers
import data.terraform.gcp.security.beyondcorp.google_beyondcorp_app_gateway.vars

conditions := [
  [
    {
      "situation_description": "AppGateway uses an unapproved hosting type.",
      "remedies": ["Set 'host_type' to 'GCP_REGIONAL_MIG'."]
    },
    {
      "condition": "Host type must be GCP_REGIONAL_MIG.",
      "attribute_path": ["host_type"],
      "values": ["GCP_REGIONAL_MIG"],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
