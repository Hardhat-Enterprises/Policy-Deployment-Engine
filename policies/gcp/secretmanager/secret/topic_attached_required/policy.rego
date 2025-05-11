package terraform.gcp.security.secretmanager.secret.topic_attached_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.secretmanager.secret.vars

conditions := [
  [
    {
      "situation_description": "Secret has no Pub/Sub topics attached",
      "remedies": ["Attach at least one Pub/Sub topic under 'topics' to enable auditing or rotation alerts"]
    },
    {
      "condition": "No topics are configured",
      "attribute_path": ["topics"],
      "values": [[]],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
