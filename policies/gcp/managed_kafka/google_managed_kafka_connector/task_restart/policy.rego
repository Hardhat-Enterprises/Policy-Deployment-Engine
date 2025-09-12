package terraform.gcp.security.managed_kafka.google_managed_kafka_connector.task_restart
import data.terraform.gcp.helpers
import data.terraform.gcp.security.managed_kafka.google_managed_kafka_connector.vars

conditions := [

  
  [
    {
      "situation_description": "Kafka Connectors should use a secure and sensible task restart policy to prevent rapid retries or high downtime.",
      "remedies": [
        "Set 'minimum_backoff' to at least 30 seconds.",
        "Set 'maximum_backoff' to no more than 3600 seconds."
      ]
    },
    {
      "condition": "Backoff durations must fall within secure bounds",
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