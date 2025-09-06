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
      "condition": "Require reserved_range when using private connectivity (whitelist: reservedRange must be set)",
      "attribute_path": ["reserved_range"],
      "values": ["*"], # Any non-empty string
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details