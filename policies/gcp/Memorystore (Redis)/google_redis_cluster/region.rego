package terraform.gcp.security.memorystore_redis.google_redis_cluster.region
import data.terraform.helpers
import data.terraform.gcp.security.memorystore_redis.google_redis_cluster.vars

conditions := [[
  {"situation_description":"Redis Cluster is outside approved Australian regions.","remedies":["Use an approved Australian region."]},
  {"condition":"region must be approved.","attribute_path":["region"],"values":["australia-southeast1","australia-southeast2"],"policy_type":"whitelist"}
]]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
