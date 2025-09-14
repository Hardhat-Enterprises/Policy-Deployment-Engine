package terraform.gcp.security.developer_connect.google_developer_connect_connection.approved_host_uri
import data.terraform.gcp.helpers
import data.terraform.gcp.security.developer_connect.google_developer_connect_connection.vars

conditions := [
  [
    {
      "situation_description": "Enterprise host URI must use HTTPS",
      "remedies": ["Set github_enterprise_config.host_uri to an HTTPS URL"]
    },
    {
      "condition": "Host URI is not the approved HTTPS value",
      "attribute_path": ["github_enterprise_config", 0, "host_uri"],
      "values": ["https://ghe.example.com"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
