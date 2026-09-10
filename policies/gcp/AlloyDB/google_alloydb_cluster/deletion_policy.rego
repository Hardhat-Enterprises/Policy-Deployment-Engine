package terraform.gcp.security.alloydb.google_alloydb_cluster.deletion_policy

import data.terraform.helpers as helpers
import data.terraform.gcp.security.alloydb.google_alloydb_cluster.vars as vars

conditions := [[
  {
    "situation_description": "AlloyDB Cluster must be protected from accidental deletion.",
    "remedies": ["Set deletion_policy = RETAIN (recommended)."],
  },
  {
    "condition": "deletion_policy must be RETAIN.",
    "attribute_path": ["deletion_policy"],
    "values": ["RETAIN"],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
