package terraform.gcp.security.alloydb.google_alloydb_cluster.network_config

import data.terraform.gcp.helpers as helpers
import data.terraform.gcp.security.alloydb.google_alloydb_cluster.vars as vars

conditions := [[
  {
    "situation_description": "AlloyDB cluster must use an approved VPC network.",
    "remedies": ["Set the top-level network field to one of the approved VPC self_links (projects/<p>/global/networks/<vpc>)."],
  },
  {
    "condition": "VPC network must be on the allowlist.",
    "attribute_path": ["network"],
    "values": [
      "projects/pde-demo/global/networks/prod-vpc",
      "projects/shared-host-project/global/networks/shared-vpc"
    ],
    "policy_type": "whitelist",
  },
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
