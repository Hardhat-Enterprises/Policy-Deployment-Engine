package terraform.gcp.security.memorystore_redis.google_redis_cluster.cross_cluster_replication_config_cluster_role

import data.terraform.gcp.security.memorystore_redis.google_redis_cluster.vars
import data.terraform.helpers.shared

conditions := []

resources := [
  resource |
  resource := input.planned_values.root_module.resources[_]
  resource.type == vars.variables.resource_type
]

replication_config(resource) = cfg if {
  configs := object.get(resource.values, "cross_cluster_replication_config", [])
  is_array(configs)
  count(configs) > 0
  cfg := configs[0]
}

has_primary_cluster(resource) if {
  cfg := replication_config(resource)
  primary := object.get(cfg, "primary_cluster", [])
  is_array(primary)
  count(primary) > 0
}

non_compliant_resource(resource) if {
  has_primary_cluster(resource)
  cfg := replication_config(resource)
  object.get(cfg, "cluster_role", null) != "SECONDARY"
}

non_compliant_resources := [
  resource |
  resource := resources[_]
  non_compliant_resource(resource)
]

non_compliant_names := [
  shared.get_resource_attribute(resource, vars.variables.resource_value_name) |
  resource := non_compliant_resources[_]
]

display := concat(", ", non_compliant_names) if {
  count(non_compliant_names) > 0
}

display := "None - All passed" if {
  count(non_compliant_names) == 0
}

message := [
  sprintf("Total %s detected: %d ", [vars.variables.friendly_resource_name, count(resources)]),
  "Situation 1: A Redis Cluster configured with a primary replication source is not read-only.",
  sprintf("Non-Compliant Resources: %s", [display]),
  "Potential Remedies: Set cluster_role to SECONDARY when primary_cluster is configured."
]

details := [{
  "situation": "A Redis Cluster configured with a primary replication source is not read-only.",
  "remedies": [
    "Set cluster_role to SECONDARY when primary_cluster is configured."
  ],
  "non_compliant_resources": non_compliant_names
}]
