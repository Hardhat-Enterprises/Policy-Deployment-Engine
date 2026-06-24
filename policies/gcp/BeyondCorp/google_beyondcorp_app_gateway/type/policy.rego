package terraform.gcp.security.beyondcorp.google_beyondcorp_app_gateway.type

import data.terraform.helpers
import data.terraform.gcp.security.beyondcorp.google_beyondcorp_app_gateway.vars

conditions := [
  [
    {
      "situation_description": "Unsupported App Gateway type detected.",
      "remedies": ["Use 'TCP_PROXY' only."]
    },
    {
      "condition": "App Gateway type must be TCP_PROXY",
      "attribute_path": ["type"],
      "values": ["TCP_PROXY"],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
