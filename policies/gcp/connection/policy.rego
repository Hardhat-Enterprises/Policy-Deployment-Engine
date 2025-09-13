package terraform.gcp.security.service_networking.connection

import data.terraform.gcp.helpers
import data.terraform.gcp.security.service_networking.connection.vars

banned_ranges := vars.variables["banned_ip_ranges"]

conditions := [
    [
      {
        "situation_description": "The private service connection is using a disallowed IP range.",
        "remedies": [
        "Choose an allowed CIDR block that doesn’t overlap with RFC1918 reserved ranges."
        ],
      },
      {
        "condition": "connection does NOT use a banned IP range",
        "attribute_path": ["reserved_peering_ranges", 0],
        "values": banned_ranges,
        "policy_type": "blacklist"
      },
  ]

]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
