package terraform.gcp.security.scc.google_scc_notification_config.pubsub_topic

import data.terraform.gcp.helpers
import data.terraform.gcp.security.scc.google_scc_notification_config.vars

conditions := [
  [
    {
      "situation_description": "SCC Notification Config is using an unapproved Pub/Sub topic.",
      "remedies": [
        "Use only approved Pub/Sub topics for notification delivery.",
        "Update the pubsub_topic field to match an approved value."
      ]
    },
    {
      "condition": "Pub/Sub topic must be in the approved allowlist.",
      "attribute_path": ["pubsub_topic"],
      "values": [
        "projects/my-project/topics/security-events",
        "projects/prod-project/topics/scc-notifications"
      ],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
