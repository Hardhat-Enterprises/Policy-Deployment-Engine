package terraform.gcp.security.microsoft_ad.google_active_directory_domain.authorized_networks

import data.terraform.gcp.helpers
import data.terraform.gcp.security.microsoft_ad.google_active_directory_domain.vars

# Define blacklisted values (public or empty IPs)
conditions := [
  [
    {
      "situation_description": "Authorized networks contain invalid or public IP ranges.",
      "remedies": [
        "Use private IP ranges like 192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12.",
        "Avoid empty or public IPs like 0.0.0.0/0"
      ]
    },
    {
      "condition": "Check if authorized_networks[0] contains blacklisted values",
      "attribute_path": ["authorized_networks", 0],
      "values": ["", "0.0.0.0/0", "8.8.8.8/32", "1.1.1.1/32", "203.0.113.0/24"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
