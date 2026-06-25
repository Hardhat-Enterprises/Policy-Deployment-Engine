package terraform.gcp.security.cloud_pub_sub.google_pubsub_schema.type

import data.terraform.helpers
import data.terraform.gcp.security.cloud_pub_sub.google_pubsub_schema.vars

conditions := [
  [
    {"situation_description": "Pub/Sub Schema type is unspecified or not set to an explicit format.",
     "remedies": [
       "Set 'type' to 'PROTOCOL_BUFFER' or 'AVRO' to enforce message structure validation.",
       "Avoid leaving type as 'TYPE_UNSPECIFIED' — this disables schema enforcement.",
       "Schema enforcement prevents malformed messages from being published to the topic."
     ]},
    {
      "condition": "type must be PROTOCOL_BUFFER or AVRO.",
      "attribute_path": ["type"],
      "values": ["PROTOCOL_BUFFER", "AVRO"],
      "policy_type": "whitelist"
    }
  ]
]

result = helpers.get_multi_summary(conditions, vars.variables)
message = result.message
details = result.details
