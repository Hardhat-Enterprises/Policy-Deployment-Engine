package terraform.gcp.security.memorystore_redis.google_redis_cluster.kms_key
import data.terraform.helpers
import data.terraform.gcp.security.memorystore_redis.google_redis_cluster.vars

conditions := [[
  {"situation_description":"No customer-managed encryption key is configured.","remedies":["Set kms_key to a non-empty customer-managed Cloud KMS key path."]},
  {"condition":"kms_key must be configured.","attribute_path":["kms_key"],"values":[null,""],"policy_type":"blacklist"}
]]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
