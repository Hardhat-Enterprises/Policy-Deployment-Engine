package terraform.gcp.security.scc.google_scc_notification_config.pubsub_topic

import data.terraform.helpers
import data.terraform.gcp.security.scc.google_scc_notification_config.vars

conditions := [
  [
    {
      "situation_description": "Notification config must use an approved Pub/Sub topic.",
      "remedies": [
        "Use one of the allowlisted Pub/Sub topics within the security project.",
        "Do not publish SCC findings to test or temporary topics."
      ]
    },
    {
      "condition": "Pub/Sub topic must be from the allowlist.",
      "attribute_path": ["pubsub_topic"],
      "values": [
        "projects/*/topics/*",
        [["security-core", "sec-ops"], ["scc-findings", "scc-high"]]
      ],
      "policy_type": "pattern whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
