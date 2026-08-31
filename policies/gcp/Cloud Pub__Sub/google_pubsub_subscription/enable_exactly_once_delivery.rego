package terraform.gcp.security.cloud_pub_sub.google_pubsub_subscription.enable_exactly_once_delivery

import data.terraform.helpers
import data.terraform.gcp.security.cloud_pub_sub.google_pubsub_subscription.vars

conditions := [
  [
    {"situation_description": "Pub/Sub Subscription does not have exactly-once delivery enabled.",
     "remedies": [
       "Set 'enable_exactly_once_delivery' to true on the subscription.",
       "Exactly-once delivery prevents duplicate message processing and ensures data integrity.",
       "Review downstream consumers to ensure they support exactly-once semantics."
     ]},
    {
      "condition": "enable_exactly_once_delivery must be true.",
      "attribute_path": ["enable_exactly_once_delivery"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

result = helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
