package terraform.gcp.security.developer_connect.google_developer_connect_connection.bitbucket_cloud_config_webhook_secret_secret_version
import data.terraform.helpers
import data.terraform.gcp.security.developer_connect.google_developer_connect_connection.vars

common := ["projects/*/secrets/*/versions/*", [["pde2025"], ["bbc-webhook","bbc-read-cred","bbc-auth-cred"], ["latest"]]]

conditions := [
    [
    {"situation_description":"BBC webhook secret must be from approved path",
     "remedies":["Use projects/pde2025/secrets/bbc-webhook/versions/latest"]},
    {"condition":"Webhook secret path not approved",
     "attribute_path":["bitbucket_cloud_config",0,"webhook_secret_secret_version"],
     "values": common,
     "policy_type":"pattern whitelist"}
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details