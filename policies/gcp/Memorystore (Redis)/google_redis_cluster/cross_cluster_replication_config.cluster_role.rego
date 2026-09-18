package terraform.gcp.security.memorystore_redis.google_redis_cluster.cross_cluster_replication_config_cluster_role

import data.terraform.helpers
import data.terraform.gcp.security.memorystore_redis.google_redis_cluster.vars

conditions := [[
  {
    "situation_description": "The cross-cluster replication role is not explicitly configured.",
    "remedies": [
      "Select an explicit replication role: NONE, PRIMARY, or SECONDARY."
    ]
  },
  {
    "condition": "cluster_role must use an explicit supported replication role.",
    "attribute_path": ["cross_cluster_replication_config", 0, "cluster_role"],
    "values": [
      "NONE",
      "PRIMARY",
      "SECONDARY"
    ],
    "policy_type": "whitelist"
  }
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
