package terraform.gcp.security.developer_connect.google_developer_connect_connection.bitbucket_data_center_config_host_uri
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
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details