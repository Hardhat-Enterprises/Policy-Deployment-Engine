package terraform.gcp.security.memorystore_redis.google_redis_cluster.server_ca_mode

import data.terraform.helpers
import data.terraform.gcp.security.memorystore_redis.google_redis_cluster.vars

conditions := [[
  {
    "situation_description": "Redis Cluster does not use an organisation-controlled customer-managed CA.",
    "remedies": [
      "Set server_ca_mode to SERVER_CA_MODE_CUSTOMER_MANAGED_CAS_CA."
    ]
  },
  {
    "condition": "server_ca_mode must use the customer-managed CA mode.",
    "attribute_path": ["server_ca_mode"],
    "values": ["SERVER_CA_MODE_CUSTOMER_MANAGED_CAS_CA"],
    "policy_type": "whitelist"
  }
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
