package terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_active_directory.dns  
import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_cloud_netapp_volumes.google_netapp_active_directory.vars


conditions := [
    [
    {"situation_description": "DNS must be internal and redundant",
     "remedies": ["Set dns to a comma-separated list of internal AD DNS IPs (no spaces), e.g. \"10.10.0.10,10.10.0.11\""]},
    {
      "condition": "dns uses only RFC1918 IPv4 addresses and lists at least two servers",
      "attribute_path": ["dns"],
      "values": [
        "^(?:(?:10\\.(?:\\d{1,3}\\.){2}\\d{1,3})|(?:172\\.(?:1[6-9]|2\\d|3[0-1])\\.\\d{1,3}\\.\\d{1,3})|(?:192\\.168\\.\\d{1,3}\\.\\d{1,3}))(?:,(?:(?:10\\.(?:\\d{1,3}\\.){2}\\d{1,3})|(?:172\\.(?:1[6-9]|2\\d|3[0-1])\\.\\d{1,3}\\.\\d{1,3})|(?:192\\.168\\.\\d{1,3}\\.\\d{1,3})))+$"
      ],
      "policy_type": "pattern whitelist"
    }
  ],
  [
    {"situation_description": "Block public DNS resolvers",
     "remedies": ["Remove public DNS like 8.8.8.8 or 1.1.1.1 from the dns field"]},
    {
      "condition": "dns must not contain known public DNS IPs",
      "attribute_path": ["dns"],
      "values": ["8\\.8\\.8\\.8", "8\\.8\\.4\\.4", "1\\.1\\.1\\.1", "9\\.9\\.9\\.9"],
      "policy_type": "pattern blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details