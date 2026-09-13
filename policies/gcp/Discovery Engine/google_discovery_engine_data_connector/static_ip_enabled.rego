package terraform.gcp.security.discovery_engine.google_discovery_engine_data_connector.static_ip_enabled

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_data_connector.vars

conditions := [
  [
    {
      "situation_description": "Does the Discovery Engine data connector use static IP addresses?",
      "remedies": ["Enable static IP addresses for controlled network access."]
    },
    {
      "condition": "Static IP addresses are not enabled",
      "attribute_path": ["static_ip_enabled"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details