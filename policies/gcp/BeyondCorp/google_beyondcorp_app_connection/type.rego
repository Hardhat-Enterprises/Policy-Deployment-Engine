package terraform.gcp.security.beyondcorp.google_beyondcorp_app_connection.type

import data.terraform.helpers
import data.terraform.gcp.security.beyondcorp.google_beyondcorp_app_connection.vars

conditions := [
  [
    {
      "situation_description": "Invalid App Connection type detected.",
      "remedies": ["Use App Connection type as TCP_PROXY."]
    },
    {
      "condition": "App Connection type must be TCP_PROXY.",
      "attribute_path": ["type"],
      "values": ["TCP_PROXY"],
      "policy_type": "whitelist"
    }
  ]
]


result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
