package terraform.gcp.security.memorystore_redis.google_redis_cluster.server_ca_mode

import data.terraform.helpers
import data.terraform.gcp.security.memorystore_redis.google_redis_cluster.vars

conditions := [[
  {
    "situation_description": "The Redis Cluster server CA mode is not explicitly configured to a supported CA mode.",
    "remedies": [
      "Select one of the explicit supported server CA modes."
    ]
  },
  {
    "condition": "server_ca_mode must use an explicit supported CA mode.",
    "attribute_path": ["server_ca_mode"],
    "values": [
      "SERVER_CA_MODE_GOOGLE_MANAGED_PER_INSTANCE_CA",
      "SERVER_CA_MODE_GOOGLE_MANAGED_SHARED_CA",
      "SERVER_CA_MODE_CUSTOMER_MANAGED_CAS_CA"
    ],
    "policy_type": "whitelist"
  }
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
