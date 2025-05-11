package terraform.gcp.security.datastream.private_connection.subnet_validation

import data.terraform.gcp.helpers
import data.terraform.gcp.security.datastream.private_connection.vars

conditions := [
  [
    {
      "situation_description": "Subnet range used in private connection is not within the approved CIDR blocks.",
      "remedies": [
        "Use a subnet within an approved private IP range like 10.0.0.0/24 or 192.168.0.0/24."
      ]
    },
    {
      "condition": "Subnet must fall within allowed CIDR ranges.",
      "attribute_path": ["vpc_peering_config", 0, "subnet"],
      "values": ["10.0.0.0/29", "192.168.1.0/28"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details