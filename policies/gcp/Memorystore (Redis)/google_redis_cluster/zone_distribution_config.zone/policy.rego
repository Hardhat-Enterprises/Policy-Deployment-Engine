package terraform.gcp.security.memorystore_redis.google_redis_cluster.zone_distribution_config_zone
import data.terraform.helpers
import data.terraform.gcp.security.memorystore_redis.google_redis_cluster.vars

conditions := [[
  {"situation_description":"Single-zone Redis Cluster is outside approved Australian zones.","remedies":["Use an approved Australian zone."]},
  {"condition":"zone must be approved.","attribute_path":["zone_distribution_config",0,"zone"],"values":["australia-southeast1-a","australia-southeast1-b","australia-southeast1-c","australia-southeast2-a","australia-southeast2-b","australia-southeast2-c"],"policy_type":"whitelist"}
]]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
