package terraform.gcp.security.service_networking.connection

import data.terraform.gcp.helpers
import data.terraform.gcp.security.service_networking.connection.vars

allowed_ranges := vars.variables["allowed_ip_ranges"]

conditions := [
  [
    {
      "situation_description": "The private service connection must use only whitelisted IP ranges.",
      "remedies": [
        "Update reserved_peering_ranges to a CIDR block explicitly allowed in vars.rego."
      ],
    },
    {
      "condition": "connection uses only allowed IP ranges",
      "attribute_path": ["planned_values", "root_module", "resources", "*", "values", "reserved_peering_ranges", "*"],
      "values": allowed_ranges,
      "policy_type": "whitelist"
    },
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
