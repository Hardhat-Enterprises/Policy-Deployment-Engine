# policies/gcp/looker/core/custom_domain_when_private/policy.rego
package terraform.gcp.security.looker.core.custom_domain_when_private

import data.terraform.gcp.helpers
import data.terraform.gcp.security.looker.core.vars

# IF public_ip_enabled == false THEN custom_domain.domain must be set
conditions := [
  [
    {
      "situation_description": "Custom domain required for private/PSC connectivity but not configured",
      "remedies": [
        "Configure a custom_domain block with a non-empty domain",
        "Set domain to a valid hostname for private access",
        "Ensure DNS is properly configured for the custom domain"
      ]
    },
    # Guard: "public is OFF" → activate this situation when public_ip_enabled ≠ true (i.e., false/null)
    {
      "condition": "Guard: public IP is OFF",
      "attribute_path": ["public_ip_enabled"],
      "policy_type": "whitelist",
      "values": [true]
    },
    # Requirement: domain must be present → violate when missing/empty
    {
      "condition": "custom_domain.domain must be set",
      "attribute_path": ["custom_domain", 0, "domain"],
      "policy_type": "blacklist",
      "values": [null, ""]
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details