package terraform.gcp.security.memorystore_redis.google_redis_cluster.server_ca_mode

import data.terraform.helpers
import data.terraform.gcp.security.memorystore_redis.google_redis_cluster.vars

conditions := [
  [
    {
      "situation_description": "The Redis Cluster server CA mode is explicitly set to the unspecified sentinel.",
      "remedies": [
        "Omit server_ca_mode to use the safe per-instance CA default, or select an explicit supported CA mode."
      ]
    },
    {
      "condition": "server_ca_mode must not explicitly use SERVER_CA_MODE_UNSPECIFIED.",
      "attribute_path": ["server_ca_mode"],
      "values": ["SERVER_CA_MODE_UNSPECIFIED"],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
