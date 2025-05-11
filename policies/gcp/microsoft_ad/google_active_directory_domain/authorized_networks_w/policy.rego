package terraform.gcp.security.microsoft_ad.google_active_directory_domain.authorized_networks_w

import data.terraform.gcp.helpers
import data.terraform.gcp.security.microsoft_ad.google_active_directory_domain.vars

# Allow only internal/private IP CIDRs in authorized_networks
conditions := [
  [
    {
      "situation_description": "Public IP ranges are included in authorized_networks.",
      "remedies": [
        "Restrict access to private/internal IP ranges such as 10.0.0.0/8 or 192.168.0.0/16"
      ]
    },
    {
      "condition": "Ensure authorized_networks only contains whitelisted private ranges.",
      "attribute_path": ["authorized_networks"],
      "values": [
        "10.0.0.0/8",
        "172.16.0.0/12",
        "192.168.0.0/16"
      ],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
