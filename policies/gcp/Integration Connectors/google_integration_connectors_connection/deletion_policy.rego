package terraform.gcp.security.integration_connectors.google_integration_connectors_connection.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.integration_connectors.google_integration_connectors_connection.vars

conditions := [
  [
    {
      "situation_description": "The connection can be destroyed by a Terraform run, so removing the resource block takes down a live integration with no barrier in the pipeline.",
      "remedies": [
        "Set deletion_policy to PREVENT."
      ]
    },
    {
      "condition": "deletion_policy must block destruction of the connection.",
      "attribute_path": ["deletion_policy"],
      "values": ["PREVENT"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
