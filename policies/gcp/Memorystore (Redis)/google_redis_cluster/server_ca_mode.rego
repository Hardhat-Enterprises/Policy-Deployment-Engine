package terraform.gcp.security.memorystore_redis.google_redis_cluster.server_ca_mode

import data.terraform.helpers
import data.terraform.gcp.security.memorystore_redis.google_redis_cluster.vars

conditions := [[
  {
    "situation_description": "The Redis Cluster server CA mode is unspecified.",
    "remedies": ["Select an explicit supported server CA mode."]
  },
  {
    "condition": "server_ca_mode must not use the unspecified sentinel.",
    "attribute_path": ["server_ca_mode"],
    "values": ["SERVER_CA_MODE_UNSPECIFIED"],
    "policy_type": "blacklist"
  }
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
