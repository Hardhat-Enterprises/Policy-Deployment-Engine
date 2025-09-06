package terraform.gcp.security.looker.core.reserved_range_for_psa_psc
import data.terraform.gcp.helpers
import data.terraform.gcp.security.looker.core.vars

conditions := [
  [
    {
      "situation_description": "Reserved range required for Private Service Access/PSC but not configured",
      "remedies": [
        "Configure reserved_range field for private connectivity",
        "Set reserved_range to a valid reserved IP range path",
        "Example: projects/PROJECT_ID/global/addresses/RESERVED_RANGE_NAME"
      ]
    },
    {
      "condition": "Require reserved range for private/PSC connectivity (whitelist: reservedRange must be set when private/PSC)",
      "attribute_path": ["reserved_range"],
      "values": ["projects/test-project-123/global/addresses/test-reserved-range"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
