package terraform.gcp.security.dms.private_connection.labels

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dms.private_connection.vars

conditions := [
  [
    {
      "situation_description": "Labels are not applied. Labels improve visibility and management of resources.",
      "remedies": ["Add meaningful 'labels' such as team, environment, or cost center."]
    },
    {
      "condition": "Empty or null labels",
      "attribute_path": ["labels"],
      "values": [null, {}],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
