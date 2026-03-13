package terraform.gcp.security.managed_kafka.google_managed_kafka_connector.task_restart
import data.terraform.helpers
import data.terraform.gcp.security.managed_kafka.google_managed_kafka_connector.vars

conditions := [

  # SCENARIO 1 — Check minimum_backoff is at least 30s
  [
    {
      "situation_description": "Kafka Connectors should use a secure task restart policy to avoid rapid retries.",
      "remedies": ["Set 'minimum_backoff' to at least 30 seconds."]
    },
    {
      "condition": "minimum_backoff must be >= 30s",
      "attribute_path": ["task_restart_policy", "minimum_backoff"],
      "values": [
        "30s", "60s", "90s", "120s", "300s", "600s", "900s", "1800s", "3600s"
      ],
      "policy_type": "whitelist"
    }
  ],

  # SCENARIO 2 — Check maximum_backoff is at most 3600s
  [
    {
      "situation_description": "Kafka Connectors should use a secure task restart policy to avoid long outages.",
      "remedies": ["Set 'maximum_backoff' to no more than 3600 seconds."]
    },
    {
      "condition": "maximum_backoff must be <= 3600s",
      "attribute_path": ["task_restart_policy", "maximum_backoff"],
      "values": [
        "30s", "60s", "90s", "120s", "300s", "600s", "900s", "1800s", "3600s"
      ],
      "policy_type": "whitelist"
    }
  ]

]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details