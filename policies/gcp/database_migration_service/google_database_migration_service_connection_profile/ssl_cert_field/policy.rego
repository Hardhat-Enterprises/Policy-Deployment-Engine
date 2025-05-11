package terraform.gcp.security.dms.connection_profile.ssl_cert_fields

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dms.connection_profile.vars

conditions := [
  [
    {
      "situation_description": "PostgreSQL connection profile uses SSL type 'REQUIRED' but is missing SSL certificates.",
      "remedies": [
        "Ensure 'client_key', 'client_certificate', and 'ca_certificate' are configured under postgresql.ssl."
      ]
    },
    {
      "condition": "client_key should not be null or empty when ssl.type is 'REQUIRED'",
      "attribute_path": ["postgresql", 0, "ssl", 0, "client_key"],
      "values": ["", null],
      "policy_type": "blacklist"
    },
    {
      "condition": "client_certificate should not be null or empty when ssl.type is 'REQUIRED'",
      "attribute_path": ["postgresql", 0, "ssl", 0, "client_certificate"],
      "values": ["", null],
      "policy_type": "blacklist"
    },
    {
      "condition": "ca_certificate should not be null or empty when ssl.type is 'REQUIRED'",
      "attribute_path": ["postgresql", 0, "ssl", 0, "ca_certificate"],
      "values": ["", null],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
