package terraform.gcp.security.developer_connect.google_developer_connect_connection.github_enterprise_config_sub_attributes
import data.terraform.helpers
import data.terraform.gcp.security.developer_connect.google_developer_connect_connection.vars

conditions := [
  [
    {"situation_description":"Enterprise host URI must be HTTPS and approved",
     "remedies":["Use https://ghe.example.com"]},
    {"condition":"Host URI not approved",
     "attribute_path":["github_enterprise_config",0,"host_uri"],
     "values":["https://ghe.example.com"],
     "policy_type":"whitelist"}
  ],
  [
    {"situation_description":"Non-HTTPS enterprise host URIs are blocked",
     "remedies":["Use https://… instead of http://, ssh://, git://"]},
    {"condition":"Host URI uses a disallowed scheme",
     "attribute_path":["github_enterprise_config",0,"host_uri"],
     "values":["http://*","ssh://*","git://*"],
     "policy_type":"pattern blacklist"}
  ],
  [
    {"situation_description":"GHE private key must come from approved Secret Manager path",
     "remedies":["Use projects/pde2025/secrets/ghe-private-key/versions/latest"]},
    {"condition":"Private key path not approved",
     "attribute_path":["github_enterprise_config",0,"private_key_secret_version"],
     "values":["projects/*/secrets/*/versions/*", [["pde2025"], ["ghe-private-key"], ["latest"]]],
     "policy_type":"pattern whitelist"}
  ],
  [
    {"situation_description":"GHE webhook secret must come from approved Secret Manager path",
     "remedies":["Use projects/pde2025/secrets/ghe-webhook/versions/latest"]},
    {"condition":"Webhook secret path not approved",
     "attribute_path":["github_enterprise_config",0,"webhook_secret_secret_version"],
     "values":["projects/*/secrets/*/versions/*", [["pde2025"], ["ghe-webhook"], ["latest"]]],
     "policy_type":"pattern whitelist"}
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
