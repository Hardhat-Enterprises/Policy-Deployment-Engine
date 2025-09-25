package terraform.gcp.security.beyondcorp.google_beyondcorp_app_gateway.region_whitelist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.beyondcorp.google_beyondcorp_app_gateway.vars

conditions := [
  [
    {
      "situation_description": "AppGateway is created in a region outside the approved Australia region.",
      "remedies": ["Use region 'australia-southeast1 or australia-southeast2' only."]
    },
    {
      "condition": "Region must be whitelisted",
      "attribute_path": ["region"],
      "values": ["australia-southeast1", "australia-southeast2"],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
