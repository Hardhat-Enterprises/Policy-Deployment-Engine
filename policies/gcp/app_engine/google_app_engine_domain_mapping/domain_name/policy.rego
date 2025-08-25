package terraform.gcp.security.app_engine.google_app_engine_domain_mapping.domain_name

import data.terraform.gcp.helpers
import data.terraform.gcp.security.app_engine.google_app_engine_domain_mapping.vars



conditions := [
  [
    {
      "situation_description": "App Engine domain mapping uses an unapproved domain name",
      "remedies": [
        "Use only approved domain names",
        "Update the domain_name field to an approved value"
      ]
    },
    {
      "condition": "Domain name is approved",
      "attribute_path": ["values", "domain_name"],
      "values": ["secure-service.example.com"],   # add more approved names here if needed
      "policy_type": "whitelist"
    }
  ],
  [
    {
      "situation_description": "App Engine domain mapping does not have SSL enabled",
      "remedies": [
        "Enable SSL management by setting ssl_management_type to AUTOMATIC or MANUAL",
        "Ensure all domain mappings use secure HTTPS connections"
      ]
    },
    {
      "condition": "SSL management type is AUTOMATIC or MANUAL",
      "attribute_path": ["values", "ssl_settings", 0, "ssl_management_type"],
      "values": ["AUTOMATIC", "MANUAL"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
