package terraform.gcp.security.scc.google_scc_notification_config.streaming_config_filter

import data.terraform.helpers
import data.terraform.gcp.security.scc.google_scc_notification_config.vars

conditions := [
  [
    {
      "situation_description": "Streaming config must reference HIGH or CRITICAL severity findings.",
      "remedies": [
        "Set the filter to an approved severity expression."
      ]
    },
    {
      "condition": "Filter must exactly match one of the approved severities.",
      "attribute_path": ["streaming_config", 0, "filter"],
      "values": [
        "severity=\"HIGH\"",
        "severity=\"CRITICAL\"",
        "severity:(HIGH OR CRITICAL)",
        "severity=\"HIGH\" OR severity=\"CRITICAL\""
      ],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
