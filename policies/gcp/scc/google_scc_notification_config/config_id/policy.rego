package terraform.gcp.security.scc.google_scc_notification_config.config_id

import data.terraform.gcp.helpers
import data.terraform.gcp.security.scc.google_scc_notification_config.vars

conditions := [
  [
    {
      "situation_description": "SCC Notification Config is using an unapproved config_id.",
      "remedies": [
        "Use only approved config_id values.",
        "Update the config_id field to match an approved value."
      ]
    },
    {
      "condition": "config_id must be in the approved allowlist.",
      "attribute_path": ["config_id"],
      "values": [
        "scc_good_config",
        "scc_prod_config"
      ],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
