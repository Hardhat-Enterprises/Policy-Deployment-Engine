package terraform.gcp.security.managed_kafka.google_managed_kafka_connector.enforce_connector
import data.terraform.gcp.helpers
import data.terraform.gcp.security.managed_kafka.google_managed_kafka_connector.vars


conditions := [

  # SCENARIO 1 — Require specific connector class
  [
    {
      "situation_description": "Only approved connector classes should be used in Kafka Connect deployments.",
      "remedies": [
        "Use 'com.google.pubsub.kafka.sink.CloudPubSubSinkConnector' or other whitelisted connector classes.",
        "Update the 'connector.class' field to match approved values."
      ]
    },
    {
      "condition": "Connector class must be approved",
      "attribute_path": ["configs", "connector.class"],
      "values": [
        "com.google.pubsub.kafka.sink.CloudPubSubSinkConnector"
      ],
      "policy_type": "whitelist"
    }
  ],

  # SCENARIO 2 — Enforce presence of required configuration keys
  [
    {
      "situation_description": "Critical configuration keys like 'topics', 'tasks.max', and 'cps.project' must be present for reliable operation.",
      "remedies": [
        "Ensure 'topics', 'tasks.max', and 'cps.project' are set with non-empty values."
      ]
    },
    {
      "condition": "Must include required configuration keys",
      "attribute_path": ["configs"],
      "contains_keys": ["topics", "tasks.max", "cps.project"],
      "policy_type": "require"
    }
  ],

  # SCENARIO 3 — Enforce sensible task restart policy
  [
    {
      "situation_description": "Connector task restart policy should have sensible minimum and maximum backoff to avoid rapid retries or long outages.",
      "remedies": [
        "Set 'minimum_backoff' to at least 30 seconds.",
        "Set 'maximum_backoff' to no more than 3600 seconds (1 hour)."
      ]
    },
    {
      "condition": "Backoff durations must be within defined limits",
      "attribute_path": ["task_restart_policy"],
      "constraints": {
        "minimum_backoff": ">=30s",
        "maximum_backoff": "<=3600s"
      },
      "policy_type": "range"
    }
  ]

]

summary := {
  "message": helpers.get_multi_summary(conditions, vars.variables).message,
  "details": helpers.get_multi_summary(conditions, vars.variables).details
}
