package terraform.gcp.security.discovery_engine.google_discovery_engine_data_connector.connector_modes

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_data_connector.vars

conditions := [
  [
    {
      "situation_description": "Connector modes must be explicitly configured.",
      "remedies": ["Configure an approved connector mode instead of leaving connector_modes empty or unspecified."]
    },
    {
      "condition": "Connector modes are empty or unspecified",
      "attribute_path": ["connector_modes"],
      "values": [[], null],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Connector uses an unapproved privileged operational mode.",
      "remedies": ["Restrict connector_modes to the approved DATA_INGESTION mode."]
    },
    {
      "condition": "Connector modes are outside the approved set",
      "attribute_path": ["connector_modes"],
      "values": ["DATA_INGESTION"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details