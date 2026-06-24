package terraform.gcp.security.developer_connect.google_developer_connect_connection.github_enterprise_config_private_key_secret_version
import data.terraform.helpers
import data.terraform.gcp.security.developer_connect.google_developer_connect_connection.vars

conditions := [
    [
    {"situation_description":"GHE private key must come from approved Secret Manager path",
     "remedies":["Use projects/pde2025/secrets/ghe-private-key/versions/latest"]},
    {"condition":"Private key path not approved",
     "attribute_path":["github_enterprise_config",0,"private_key_secret_version"],
     "values":["projects/*/secrets/*/versions/*", [["pde2025"], ["ghe-private-key"], ["latest"]]],
     "policy_type":"pattern whitelist"}
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details