package terraform.gcp.security.memorystore_redis.google_redis_cluster.persistence_config_mode
import data.terraform.helpers
import data.terraform.gcp.security.memorystore_redis.google_redis_cluster.vars

conditions := [[
  {"situation_description":"Redis Cluster persistence is disabled or unspecified.","remedies":["Enable an approved persistence mode such as RDB or AOF."]},
  {"condition":"persistence mode must provide persistent recovery.","attribute_path":["persistence_config",0,"mode"],"values":["RDB","AOF"],"policy_type":"whitelist"}
]]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
