package terraform.gcp.security.developer_connect.google_developer_connect_connection.gitlab_config_read_authorizer_credential_user_token_secret_version
import data.terraform.helpers
import data.terraform.gcp.security.developer_connect.google_developer_connect_connection.vars

common := ["projects/*/secrets/*/versions/*", [["pde2025"], ["gitlab-webhook","gitlab-read-cred","gitlab-auth-cred"], ["latest"]]]

conditions := [
    [
    {"situation_description":"GitLab read token must be from approved Secret Manager path",
     "remedies":["Use projects/pde2025/secrets/gitlab-read-cred/versions/latest"]},
    {"condition":"Read token path not approved",
     "attribute_path":["gitlab_config",0,"read_authorizer_credential",0,"user_token_secret_version"],
     "values": common,
     "policy_type":"pattern whitelist"}
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details