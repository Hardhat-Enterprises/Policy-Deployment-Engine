package terraform.gcp.security.developer_connect.google_developer_connect_connection.github_config_github_app
import data.terraform.helpers
import data.terraform.gcp.security.developer_connect.google_developer_connect_connection.vars

conditions := [
    [
    {
      "situation_description": "Only the approved GitHub App is allowed",
      "remedies": ["Set github_config.github_app to DEVELOPER_CONNECT"]
    },
    {
      "condition": "GitHub App is not approved",
      "attribute_path": ["github_config", 0, "github_app"],
      "values": ["DEVELOPER_CONNECT"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details