package terraform.gcp.security.developer_connect.google_developer_connect_connection.gitlab_enterprise_config_read_authorizer_credential_user_token_secret_version
import data.terraform.helpers
import data.terraform.gcp.security.developer_connect.google_developer_connect_connection.vars

conditions := [
    [
    {"situation_description":"GitLab Enterprise read token must be from approved path",
     "remedies":["Use projects/pde2025/secrets/gitlab-enterprise-read-cred/versions/latest"]},
    {"condition":"Read token path not approved",
     "attribute_path":["gitlab_enterprise_config",0,"read_authorizer_credential",0,"user_token_secret_version"],
     "values":["projects/*/secrets/*/versions/*", [["pde2025"], ["gitlab-enterprise-read-cred"], ["latest"]]],
     "policy_type":"pattern whitelist"}
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details