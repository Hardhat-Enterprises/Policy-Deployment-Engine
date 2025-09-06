package terraform.gcp.security.looker.core.custom_domain_when_private
import data.terraform.gcp.helpers
import data.terraform.gcp.security.looker.core.vars

conditions := [
  [
    {
      "situation_description": "Custom domain required for private/PSC connectivity but not configured",
      "remedies": [
        "Configure custom_domain block with domain field",
        "Set domain to a valid hostname for private access",
        "Ensure DNS is properly configured for the custom domain"
      ]
    },
    {
      "condition": "Require custom_domain.domain when not public (publicIpEnabled=false)",
      "attribute_path": ["public_ip_enabled", "custom_domain", 0, "domain"],
      "values": [[false, "*"]], # public_ip_enabled=false AND custom_domain.domain is non-empty
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details