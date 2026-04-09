package terraform.gcp.security.developer_connect.google_developer_connect_connection.bitbucket_cloud_config_sub_attributes
import data.terraform.helpers
import data.terraform.gcp.security.developer_connect.google_developer_connect_connection.vars

common := ["projects/*/secrets/*/versions/*", [["pde2025"], ["bbc-webhook","bbc-read-cred","bbc-auth-cred"], ["latest"]]]

conditions := [
  [
    {"situation_description":"Bitbucket Cloud workspace must be approved",
     "remedies":["Set workspace to proctor-test"]},
    {"condition":"Workspace not approved",
     "attribute_path":["bitbucket_cloud_config",0,"workspace"],
     "values":["proctor-test"],
     "policy_type":"whitelist"}
  ],
  [
    {"situation_description":"BBC webhook secret must be from approved path",
     "remedies":["Use projects/pde2025/secrets/bbc-webhook/versions/latest"]},
    {"condition":"Webhook secret path not approved",
     "attribute_path":["bitbucket_cloud_config",0,"webhook_secret_secret_version"],
     "values": common,
     "policy_type":"pattern whitelist"}
  ],
  [
    {"situation_description":"BBC read token must be from approved path",
     "remedies":["Use projects/pde2025/secrets/bbc-read-cred/versions/latest"]},
    {"condition":"Read token path not approved",
     "attribute_path":["bitbucket_cloud_config",0,"read_authorizer_credential",0,"user_token_secret_version"],
     "values": common,
     "policy_type":"pattern whitelist"}
  ],
  [
    {"situation_description":"BBC auth token must be from approved path",
     "remedies":["Use projects/pde2025/secrets/bbc-auth-cred/versions/latest"]},
    {"condition":"Auth token path not approved",
     "attribute_path":["bitbucket_cloud_config",0,"authorizer_credential",0,"user_token_secret_version"],
     "values": common,
     "policy_type":"pattern whitelist"}
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
