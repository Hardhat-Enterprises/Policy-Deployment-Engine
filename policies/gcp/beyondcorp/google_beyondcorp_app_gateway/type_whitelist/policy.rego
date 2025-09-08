package terraform.gcp.security.beyondcorp.google_beyondcorp_app_gateway.type_whitelist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.beyondcorp.google_beyondcorp_app_gateway.vars

conditions := [
  [
    {
      "situation_description": "AppGateway uses a non-approved connectivity type.",
      "remedies": ["Set 'type' to 'TCP_PROXY'."]
    },
    {
      "condition": "Type must be TCP_PROXY",
      "attribute_path": ["type"],
      "values": ["TCP_PROXY"],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
