package terraform.analysis.container_cpu_throttling

import future.keywords.contains
import future.keywords.if

default deny = false

# Container CPU throttling alert must monitor Kubernetes container metrics
deny if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_monitoring_alert_policy"
    contains(resource.address, "container_cpu_throttling")

    condition := resource.values.conditions[_]
    not contains(condition.condition_threshold.filter, "k8s_container")
    not contains(condition.condition_threshold.filter, "gke_container")
}

# Container throttling alert must monitor CPU throttling metrics
deny if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_monitoring_alert_policy"
    contains(resource.address, "container_cpu_throttling")

    condition := resource.values.conditions[_]
    not contains(condition.condition_threshold.filter, "throttling")
    not contains(condition.condition_threshold.filter, "cpu/throttled_time")
}

# Container throttling threshold should not exceed 10%
deny if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_monitoring_alert_policy"
    contains(resource.address, "container_cpu_throttling")

    condition := resource.values.conditions[_]
    condition.condition_threshold.threshold_value > 0.1
}
