package terraform.analysis.cloudsql_cpu

import future.keywords.contains
import future.keywords.if
import future.keywords.in

default deny = false

# CloudSQL CPU alert must monitor cloudsql_database resource type
deny if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_monitoring_alert_policy"
    contains(resource.address, "cloudsql_cpu")

    condition := resource.values.conditions[_]
    not contains(condition.condition_threshold.filter, "cloudsql_database")
}

# CloudSQL CPU alert must monitor CPU utilization metric
deny if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_monitoring_alert_policy"
    contains(resource.address, "cloudsql_cpu")

    condition := resource.values.conditions[_]
    not contains(condition.condition_threshold.filter, "cpu/utilization")
}

# CloudSQL CPU threshold should not exceed 90%
deny if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_monitoring_alert_policy"
    contains(resource.address, "cloudsql_cpu")

    condition := resource.values.conditions[_]
    condition.condition_threshold.threshold_value > 0.9
}
