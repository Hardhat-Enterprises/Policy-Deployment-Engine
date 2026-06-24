package terraform.gcp.security.developer_connect.google_developer_connect_connection.gitlab_config_webhook_secret_secret_version
import data.terraform.helpers
import data.terraform.gcp.security.developer_connect.google_developer_connect_connection.vars

common := ["projects/*/secrets/*/versions/*", [["pde2025"], ["gitlab-webhook","gitlab-read-cred","gitlab-auth-cred"], ["latest"]]]

conditions := [
    [
    {"situation_description":"GitLab webhook secret must be from approved Secret Manager path",
     "remedies":["Use projects/pde2025/secrets/gitlab-webhook/versions/latest"]},
    {"condition":"Webhook secret path not approved",
     "attribute_path":["gitlab_config",0,"webhook_secret_secret_version"],
     "values": common,
     "policy_type":"pattern whitelist"}
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details