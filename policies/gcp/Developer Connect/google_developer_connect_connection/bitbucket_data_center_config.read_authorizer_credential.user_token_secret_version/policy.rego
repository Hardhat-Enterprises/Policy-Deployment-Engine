package terraform.gcp.security.developer_connect.google_developer_connect_connection.bitbucket_data_center_config_read_authorizer_credential_user_token_secret_version
import data.terraform.helpers
import data.terraform.gcp.security.developer_connect.google_developer_connect_connection.vars

conditions := [
    [
    {"situation_description":"BBDC read token must be from approved path",
     "remedies":["Use projects/pde2025/secrets/bbdc-read-cred/versions/latest"]},
    {"condition":"Read token path not approved",
     "attribute_path":["bitbucket_data_center_config",0,"read_authorizer_credential",0,"user_token_secret_version"],
     "values":["projects/*/secrets/*/versions/*", [["pde2025"], ["bbdc-read-cred"], ["latest"]]],
     "policy_type":"pattern whitelist"}
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details