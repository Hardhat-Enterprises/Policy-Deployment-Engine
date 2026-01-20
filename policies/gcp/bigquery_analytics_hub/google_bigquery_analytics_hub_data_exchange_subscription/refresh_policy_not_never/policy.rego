package terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_data_exchange_subscription.refresh_policy_not_never

import data.terraform.helpers
import data.terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_data_exchange_subscription.vars

conditions := [
  [
    {
      "situation_description": "Subscriptions should not be configured with refresh_policy set to NEVER.",
    "remedies": [
        "Use ON_READ (default) or ON_STALE instead.",
        "If you do not need a custom refresh policy, remove refresh_policy and rely on the default."
      ]
    },
    {
      "condition": "Fail when refresh_policy is set to NEVER.",
      "attribute_path": ["refresh_policy"],
      "values": ["NEVER"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
