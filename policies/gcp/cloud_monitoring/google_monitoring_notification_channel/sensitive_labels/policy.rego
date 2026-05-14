package terraform.gcp.security.cloud_monitoring.google_monitoring_notification_channel.sensitive_labels

import data.terraform.helpers
import data.terraform.gcp.security.cloud_monitoring.google_monitoring_notification_channel.vars

conditions := [
  [
    {
      "situation_description": "labels.auth_token is set directly, which may expose a sensitive token in normal labels",
      "remedies": [
        "Move auth_token from labels to the sensitive_labels block"
      ]
    },
    {
      "condition": "auth_token must not be set in labels",
      "attribute_path": ["labels", "auth_token"],
      "policy_type": "whitelist",
      "values": [null, ""]
    }
  ],
  [
    {
      "situation_description": "labels.password is set directly, which may expose a sensitive password in normal labels",
      "remedies": [
        "Move password from labels to the sensitive_labels block"
      ]
    },
    {
      "condition": "password must not be set in labels",
      "attribute_path": ["labels", "password"],
      "policy_type": "whitelist",
      "values": [null, ""]
    }
  ],
  [
    {
      "situation_description": "labels.service_key is set directly, which may expose a sensitive service key in normal labels",
      "remedies": [
        "Move service_key from labels to the sensitive_labels block"
      ]
    },
    {
      "condition": "service_key must not be set in labels",
      "attribute_path": ["labels", "service_key"],
      "policy_type": "whitelist",
      "values": [null, ""]
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
