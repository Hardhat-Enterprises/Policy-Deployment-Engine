package terraform.gcp.security.developer_connect.google_developer_connect_connection.bitbucket_data_center_config_sub_attributes
import data.terraform.helpers
import data.terraform.gcp.security.developer_connect.google_developer_connect_connection.vars

conditions := [
  [
    {"situation_description":"Bitbucket Data Center host URI must be HTTPS and approved",
     "remedies":["Use https://bitbucket.example.com"]},
    {"condition":"Host URI not approved",
     "attribute_path":["bitbucket_data_center_config",0,"host_uri"],
     "values":["https://bitbucket.example.com"],
     "policy_type":"whitelist"}
  ],
  [
    {"situation_description":"BBDC webhook secret must be from approved path",
     "remedies":["Use projects/pde2025/secrets/bbdc-webhook/versions/latest"]},
    {"condition":"Webhook secret path not approved",
     "attribute_path":["bitbucket_data_center_config",0,"webhook_secret_secret_version"],
     "values":["projects/*/secrets/*/versions/*", [["pde2025"], ["bbdc-webhook"], ["latest"]]],
     "policy_type":"pattern whitelist"}
  ],
  [
    {"situation_description":"BBDC read token must be from approved path",
     "remedies":["Use projects/pde2025/secrets/bbdc-read-cred/versions/latest"]},
    {"condition":"Read token path not approved",
     "attribute_path":["bitbucket_data_center_config",0,"read_authorizer_credential",0,"user_token_secret_version"],
     "values":["projects/*/secrets/*/versions/*", [["pde2025"], ["bbdc-read-cred"], ["latest"]]],
     "policy_type":"pattern whitelist"}
  ],
  [
    {"situation_description":"BBDC auth token must be from approved path",
     "remedies":["Use projects/pde2025/secrets/bbdc-auth-cred/versions/latest"]},
    {"condition":"Auth token path not approved",
     "attribute_path":["bitbucket_data_center_config",0,"authorizer_credential",0,"user_token_secret_version"],
     "values":["projects/*/secrets/*/versions/*", [["pde2025"], ["bbdc-auth-cred"], ["latest"]]],
     "policy_type":"pattern whitelist"}
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
