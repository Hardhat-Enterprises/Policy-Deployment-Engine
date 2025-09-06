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
      "condition": "Require custom domain when using private connectivity (whitelist: customDomain.domain must be set when not public)",
      "attribute_path": ["custom_domain", 0, "domain"],
      "values": ["looker.internal.company.com"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
