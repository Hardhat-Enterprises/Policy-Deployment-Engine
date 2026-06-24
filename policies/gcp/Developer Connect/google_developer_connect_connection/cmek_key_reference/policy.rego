package terraform.gcp.security.developer_connect.google_developer_connect_connection.cmek_key_reference
import data.terraform.helpers
import data.terraform.gcp.security.developer_connect.google_developer_connect_connection.vars

conditions := [
  [
    {
      "situation_description": "CMEK key must be from the approved KMS path",
      "remedies": ["Use projects/pde2025/locations/australia-southeast1/keyRings/devconnect/cryptoKeys/cmk-devconnect"]
    },
    {
      "condition": "CMEK key reference not approved",
      "attribute_path": ["crypto_key_config", 0, "key_reference"],
      "values": ["projects/pde2025/locations/australia-southeast1/keyRings/devconnect/cryptoKeys/cmk-devconnect"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
