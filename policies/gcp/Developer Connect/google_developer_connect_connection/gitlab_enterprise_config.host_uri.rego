package terraform.gcp.security.developer_connect.google_developer_connect_connection.gitlab_enterprise_config_host_uri
import data.terraform.helpers
import data.terraform.gcp.security.developer_connect.google_developer_connect_connection.vars

conditions := [
    [
    {"situation_description":"GitLab Enterprise host URI must be HTTPS and approved",
     "remedies":["Use https://gle.example.com"]},
    {"condition":"Host URI not approved",
     "attribute_path":["gitlab_enterprise_config",0,"host_uri"],
     "values":["https://gle.example.com"],
     "policy_type":"whitelist"}
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details