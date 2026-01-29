package terraform.gcp.security.alloydb.google_alloydb_cluster.network_policy

import data.terraform.gcp.helpers as helpers
import data.terraform.gcp.security.alloydb.google_alloydb_cluster.vars as vars

conditions := [[
  {
    "situation_description": "AlloyDB Cluster must use an approved VPC network.",
    "remedies": ["Set network_config.network to one of the approved VPC self-links."],
  },
  {
    "condition": "network must be on the allowlist.",
    "attribute_path": ["network_config", 0, "network"],
    "values": [
      "projects/pde-demo/global/networks/prod-vpc",
      "projects/shared-host-project/global/networks/shared-vpc"
    ],
    "policy_type": "whitelist",
  },
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
