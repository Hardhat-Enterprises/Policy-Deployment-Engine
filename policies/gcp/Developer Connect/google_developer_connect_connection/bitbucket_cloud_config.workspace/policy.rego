package terraform.gcp.security.developer_connect.google_developer_connect_connection.bitbucket_cloud_config_workspace
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
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details