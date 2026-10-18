package terraform.gcp.security.memorystore_redis.google_redis_cluster.authorization_mode
import data.terraform.helpers
import data.terraform.gcp.security.memorystore_redis.google_redis_cluster.vars

conditions := [[
  {"situation_description":"Redis Cluster authentication is disabled.","remedies":["Set authorization_mode to AUTH_MODE_IAM_AUTH."]},
  {"condition":"authorization_mode must require IAM authentication.","attribute_path":["authorization_mode"],"values":["AUTH_MODE_IAM_AUTH"],"policy_type":"whitelist"}
]]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
