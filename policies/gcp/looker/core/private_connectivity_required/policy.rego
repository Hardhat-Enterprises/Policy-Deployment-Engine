# policies/gcp/looker/core/private_connectivity_required/policy.rego
package terraform.gcp.security.looker.core.private_connectivity_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.looker.core.vars

# Policy intent:
#   1) Resource must have private connectivity: (private_ip_enabled == true) OR (psc_enabled == true)
#   2) Public IP must be disabled: public_ip_enabled == false
#
# We express this as two OR situations:
#   - Situation 1 flags when there's NO private connectivity (both private_ip_enabled != true AND psc_enabled != true)
#   - Situation 2 flags when public_ip_enabled == true

conditions := [
  # --- Situation 1: No private connectivity configured ---
  [
    {
      "situation_description": "Neither Private IP nor PSC is enabled; private connectivity is required",
      "remedies": [
        "Enable Private IP connectivity: set private_ip_enabled=true",
        "OR enable Private Service Connect: set psc_enabled=true",
        "If using PSC, configure consumer_network appropriately"
      ]
    },
    # Violates when private_ip_enabled is NOT true (false or null)
    {
      "condition": "Guard: private_ip_enabled is not true",
      "attribute_path": ["private_ip_enabled"],
      "policy_type": "whitelist",
      "values": [true]
    },
    # AND violates when psc_enabled is NOT true (false or null)
    {
      "condition": "Guard: psc_enabled is not true",
      "attribute_path": ["psc_enabled"],
      "policy_type": "whitelist",
      "values": [true]
    }
  ],

  # --- Situation 2: Public IP enabled (must be off when using private connectivity) ---
  [
    {
      "situation_description": "Public IP must be disabled when private connectivity is required",
      "remedies": [
        "Set public_ip_enabled=false",
        "Use private networking or Private Service Connect (PSC) for access"
      ]
    },
    {
      "condition": "public_ip_enabled must be false",
      "attribute_path": ["public_ip_enabled"],
      "policy_type": "blacklist",
      "values": [true]
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details