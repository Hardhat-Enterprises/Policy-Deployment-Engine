package terraform.gcp.security.integration_connectors.google_integration_connectors_connection.service_account

import data.terraform.helpers
import data.terraform.gcp.security.integration_connectors.google_integration_connectors_connection.vars

conditions := [
  [
    {
      "situation_description": "No run-as service account is set, so the connection falls back to the project default compute account, which is broadly permissioned and shared across workloads.",
      "remedies": [
        "Set service_account to a purpose-built account scoped to what this integration needs."
      ]
    },
    {
      "condition": "service_account must name an explicit account rather than defaulting.",
      "attribute_path": ["service_account"],
      "values": ["", null],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
