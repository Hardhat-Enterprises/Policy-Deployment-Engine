package terraform.gcp.security.memorystore_redis.google_redis_cluster.cross_cluster_replication_config_cluster_role
import data.terraform.helpers
import data.terraform.gcp.security.memorystore_redis.google_redis_cluster.vars

conditions := [[
  {"situation_description":"Cross-cluster replication role is unspecified.","remedies":["Set an explicit replication role."]},
  {"condition":"cluster_role must not be unspecified.","attribute_path":["cross_cluster_replication_config",0,"cluster_role"],"values":["CLUSTER_ROLE_UNSPECIFIED"],"policy_type":"blacklist"}
]]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
