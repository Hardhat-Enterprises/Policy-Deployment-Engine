package terraform.gcp.security.memorystore_redis.google_redis_cluster.deletion_protection_enabled
import data.terraform.helpers
import data.terraform.gcp.security.memorystore_redis.google_redis_cluster.vars

conditions := [[
  {"situation_description":"Deletion protection is disabled.","remedies":["Set deletion_protection_enabled to true."]},
  {"condition":"deletion_protection_enabled must be enabled.","attribute_path":["deletion_protection_enabled"],"values":[true],"policy_type":"whitelist"}
]]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
