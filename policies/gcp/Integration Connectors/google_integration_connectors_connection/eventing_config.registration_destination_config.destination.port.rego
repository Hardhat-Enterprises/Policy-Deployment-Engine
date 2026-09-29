package terraform.gcp.security.integration_connectors.google_integration_connectors_connection.eventing_config_registration_destination_config_destination_port

import data.terraform.helpers
import data.terraform.gcp.security.integration_connectors.google_integration_connectors_connection.vars

conditions := [
  [
    {
      "situation_description": "The eventing registration endpoint is reached on a port whose protocol carries no transport encryption, exposing the authentication material and event payloads on the network path.",
      "remedies": [
        "Use the encrypted equivalent port for the protocol, such as 443 instead of 80."
      ]
    },
    {
      "condition": "the eventing destination port must not be a well-known cleartext port.",
      "attribute_path": ["eventing_config", 0, "registration_destination_config", 0, "destination", 0, "port"],
      "values": [80, 21, 23, 110, 143],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
