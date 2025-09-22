package terraform.gcp.security.scc.google_scc_notification_config.streaming_config

import data.terraform.gcp.helpers
import data.terraform.gcp.security.scc.google_scc_notification_config.vars

conditions := [
  [
    {
      "situation_description": "SCC Notification Config is using a weak or unapproved streaming filter.",
      "remedies": [
        "Restrict streaming_config.filter to HIGH or CRITICAL severities.",
        "Update the filter expression to match the approved values."
      ]
    },
    {
      "condition": "Streaming filter must allow only HIGH or CRITICAL severities.",
      "attribute_path": ["streaming_config", "filter"],
      "values": [
        "severity=\"HIGH\" OR severity=\"CRITICAL\""
      ],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
