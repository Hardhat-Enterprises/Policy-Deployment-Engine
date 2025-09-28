package terraform.gcp.security.developer_connect.google_developer_connect_connection.gitlab_enterprise_config_sub_attributes
import data.terraform.gcp.helpers
import data.terraform.gcp.security.developer_connect.google_developer_connect_connection.vars

conditions := [
  [
    {"situation_description":"GitLab Enterprise host URI must be HTTPS and approved",
     "remedies":["Use https://gle.example.com"]},
    {"condition":"Host URI not approved",
     "attribute_path":["gitlab_enterprise_config",0,"host_uri"],
     "values":["https://gle.example.com"],
     "policy_type":"whitelist"}
  ],
  [
    {"situation_description":"GitLab Enterprise webhook secret must be from approved path",
     "remedies":["Use projects/pde2025/secrets/gitlab-enterprise-webhook/versions/latest"]},
    {"condition":"Webhook secret path not approved",
     "attribute_path":["gitlab_enterprise_config",0,"webhook_secret_secret_version"],
     "values":["projects/*/secrets/*/versions/*", [["pde2025"], ["gitlab-enterprise-webhook"], ["latest"]]],
     "policy_type":"pattern whitelist"}
  ],
  [
    {"situation_description":"GitLab Enterprise read token must be from approved path",
     "remedies":["Use projects/pde2025/secrets/gitlab-enterprise-read-cred/versions/latest"]},
    {"condition":"Read token path not approved",
     "attribute_path":["gitlab_enterprise_config",0,"read_authorizer_credential",0,"user_token_secret_version"],
     "values":["projects/*/secrets/*/versions/*", [["pde2025"], ["gitlab-enterprise-read-cred"], ["latest"]]],
     "policy_type":"pattern whitelist"}
  ],
  [
    {"situation_description":"GitLab Enterprise auth token must be from approved path",
     "remedies":["Use projects/pde2025/secrets/gitlab-enterprise-auth-cred/versions/latest"]},
    {"condition":"Auth token path not approved",
     "attribute_path":["gitlab_enterprise_config",0,"authorizer_credential",0,"user_token_secret_version"],
     "values":["projects/*/secrets/*/versions/*", [["pde2025"], ["gitlab-enterprise-auth-cred"], ["latest"]]],
     "policy_type":"pattern whitelist"}
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
