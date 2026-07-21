package terraform.gcp.security.discovery_engine.google_discovery_engine_data_connector.bap_config_enabled_actions

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_data_connector.vars

conditions := [
  [
    {
      "situation_description": "Are only approved connector actions enabled",
      "remedies": ["Restrict actions to the approved allow-list"]
    },
    {
      "condition": "enabled actions approved",
      "attribute_path": ["bap_config.enabled_actions"],
      "values": [
        "create_issue",
        "update_issue",
        "change_issue_status",
        "create_comment",
        "update_comment",
        "upload_attachment"
      ],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details