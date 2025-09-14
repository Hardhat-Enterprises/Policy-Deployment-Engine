# policies/gcp/looker/core/psc_mode_hygiene/policy.rego
package terraform.gcp.security.looker.core.psc_mode_hygiene

import data.terraform.gcp.helpers
import data.terraform.gcp.security.looker.core.vars

# Intent: If PSC is enabled, BOTH public_ip_enabled and private_ip_enabled must be false.

conditions := [
  # Situation A: PSC ON ∧ public_ip_enabled == true  → violation
  [
    {
      "situation_description": "PSC enabled but Public IP is still enabled",
      "remedies": [
        "Set public_ip_enabled=false when psc_enabled=true",
        "PSC requires exclusivity; disable other connectivity modes"
      ]
    },
    {
      "condition": "Guard: PSC is ON",
      "attribute_path": ["psc_enabled"],
      "policy_type": "blacklist",
      "values": [true]
    },
    {
      "condition": "Public IP must be OFF when PSC is ON",
      "attribute_path": ["public_ip_enabled"],
      "policy_type": "blacklist",
      "values": [true]
    }
  ],

  # Situation B: PSC ON ∧ private_ip_enabled == true → violation
  [
    {
      "situation_description": "PSC enabled but Private IP is still enabled",
      "remedies": [
        "Set private_ip_enabled=false when psc_enabled=true",
        "PSC requires exclusivity; disable other connectivity modes"
      ]
    },
    {
      "condition": "Guard: PSC is ON",
      "attribute_path": ["psc_enabled"],
      "policy_type": "blacklist",
      "values": [true]
    },
    {
      "condition": "Private IP must be OFF when PSC is ON",
      "attribute_path": ["private_ip_enabled"],
      "policy_type": "blacklist",
      "values": [true]
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
