package terraform.gcp.security.memorystore_redis.google_redis_cluster.transit_encryption_mode
import data.terraform.helpers
import data.terraform.gcp.security.memorystore_redis.google_redis_cluster.vars

conditions := [[
  {"situation_description":"Redis Cluster transit encryption is disabled.","remedies":["Set transit_encryption_mode to TRANSIT_ENCRYPTION_MODE_SERVER_AUTHENTICATION."]},
  {"condition":"transit encryption must be enabled.","attribute_path":["transit_encryption_mode"],"values":["TRANSIT_ENCRYPTION_MODE_SERVER_AUTHENTICATION"],"policy_type":"whitelist"}
]]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
