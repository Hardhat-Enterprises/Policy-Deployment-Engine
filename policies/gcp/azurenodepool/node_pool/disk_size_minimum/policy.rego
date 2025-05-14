package terraform.gcp.security.azurenodepool.node_pool.disk_size_minimum

import data.terraform.gcp.helpers
import data.terraform.gcp.security.azurenodepool.vars

conditions := [
  {
    "situation_description": "Node pools must have a root volume of at least 100 GiB",
    "remedies": ["Increase root volume size to ≥ 100 GiB"],
    "condition": "Root volume too small",
    "attribute_path": ["values", "config", 0, "root_volume", 0, "size_gib"],
    "range": {
      "min": 100
    },
    "policy_type": "range"
  }
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
detail  := summary.details
