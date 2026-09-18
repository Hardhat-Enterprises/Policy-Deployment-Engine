package terraform.gcp.security.memorystore_redis.google_redis_cluster.maintenance_policy_weekly_maintenance_window_day
import data.terraform.helpers
import data.terraform.gcp.security.memorystore_redis.google_redis_cluster.vars

conditions := [[
  {"situation_description":"Maintenance day is unspecified.","remedies":["Select an explicit maintenance day."]},
  {"condition":"maintenance day must not be unspecified.","attribute_path":["maintenance_policy",0,"weekly_maintenance_window",0,"day"],"values":["DAY_OF_WEEK_UNSPECIFIED"],"policy_type":"blacklist"}
]]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
