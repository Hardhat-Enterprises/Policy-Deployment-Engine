package terraform.gcp.security.looker.core.private_connectivity_required
import data.terraform.gcp.helpers
import data.terraform.gcp.security.looker.core.vars

conditions := [
  [
    {
      "situation_description": "Private connectivity not properly configured (requires privateIpEnabled=true OR pscEnabled=true, with publicIpEnabled=false)",
      "remedies": [
        "Enable private IP connectivity: set private_ip_enabled to true",
        "OR enable Private Service Connect: set psc_enabled to true",
        "Ensure public_ip_enabled is set to false",
        "Configure consumer_network for private connectivity"
      ]
    },
    {
      "condition": "Require private connectivity (whitelist: privateIpEnabled=true OR pscEnabled=true, AND publicIpEnabled=false)",
      "attribute_path": ["private_ip_enabled", "psc_enabled", "public_ip_enabled"],
      "values": [[true, null, false], [null, true, false], [false, true, false]], # private_ip_enabled=true, psc_enabled=null, public_ip_enabled=false OR psc_enabled=true, private_ip_enabled=null, public_ip_enabled=false
      "policy_type": "whitelist"
    }
  ],
  [
    {
      "situation_description": "Public IP must be disabled when using private connectivity",
      "remedies": [
        "Set public_ip_enabled to false",
        "Use private networking or Private Service Connect (PSC) for secure access"
      ]
    },
    {
      "condition": "Disallow public IP when private connectivity is required (blacklist publicIpEnabled=true)",
      "attribute_path": ["public_ip_enabled"],
      "values": [true],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details