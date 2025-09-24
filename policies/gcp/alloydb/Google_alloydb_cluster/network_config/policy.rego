package terraform.gcp.security.alloydb.google_alloydb_cluster.network_config

import data.terraform.gcp.helpers as helpers
import data.terraform.gcp.security.alloydb.google_alloydb_cluster.vars as vars

conditions := [[
  {
    "situation_description": "AlloyDB cluster must specify a VPC network.",
    "remedies": ["Set the top-level 'network' field to the required VPC self_link (projects/<p>/global/networks/<vpc>)."]
  },
  {
    "condition": "VPC network must be provided.",
    "attribute_path": ["network"],
    "policy_type": "value_absent_or_null"
  }
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
