package terraform.gcp.security.looker.core.psc_mode_hygiene
import data.terraform.gcp.helpers
import data.terraform.gcp.security.looker.core.vars

conditions := [
  [
    {
      "situation_description": "PSC mode hygiene violation: when pscEnabled=true, publicIpEnabled and privateIpEnabled must both be false",
      "remedies": [
        "When using PSC (psc_enabled=true), ensure public_ip_enabled is set to false",
        "When using PSC (psc_enabled=true), ensure private_ip_enabled is set to false",
        "PSC requires exclusivity - no other IP connectivity methods should be enabled"
      ]
    },
    {
      "condition": "Disallow public IP when PSC is enabled (blacklist: pscEnabled=true AND publicIpEnabled=true)",
      "attribute_path": ["public_ip_enabled"],
      "values": [true],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "PSC mode hygiene violation: when pscEnabled=true, privateIpEnabled must be false",
      "remedies": [
        "When using PSC (psc_enabled=true), ensure private_ip_enabled is set to false",
        "PSC requires exclusivity - no other IP connectivity methods should be enabled"
      ]
    },
    {
      "condition": "Disallow private IP when PSC is enabled (blacklist: pscEnabled=true AND privateIpEnabled=true)",
      "attribute_path": ["private_ip_enabled"],
      "values": [true],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
