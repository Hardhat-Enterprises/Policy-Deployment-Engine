package terraform.gcp.security.looker.core.no_public_ip
import data.terraform.gcp.helpers
import data.terraform.gcp.security.looker.core.vars

conditions := [
  [
    {
      "situation_description": "publicIpEnabled is true (public IP exposure increases security risk)",
      "remedies": [
        "Set public_ip_enabled to false",
        "Use private networking or Private Service Connect (PSC) for secure access"
      ]
    },
    {
      "condition": "Disallow public IP exposure (blacklist publicIpEnabled=true)",
      "attribute_path": ["public_ip_enabled"],
      "values": [true],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details