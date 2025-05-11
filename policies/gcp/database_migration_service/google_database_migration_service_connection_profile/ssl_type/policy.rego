package terraform.gcp.security.dms.connection_profile.ssl_type

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dms.connection_profile.vars

conditions := [
  [
    {
      "situation_description": "PostgreSQL connection profile does not enforce SSL (ssl.type != \"REQUIRED\")",
      "remedies": [
        "Set postgresql.ssl.type to 'REQUIRED' in the Terraform configuration.",
        "Ensure client_key, client_certificate, and ca_certificate are also configured."
      ]
    },
    {
      "condition": "PostgreSQL SSL type should be 'REQUIRED' to ensure encrypted connection",
      "attribute_path": ["postgresql", 0, "ssl", 0, "type"],
      "values": ["REQUIRED"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
