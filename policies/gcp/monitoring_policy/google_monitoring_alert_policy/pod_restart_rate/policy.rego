package terraform.analysis.pod_restart_rate

import future.keywords.contains
import future.keywords.if

default deny = false

# Pod restart rate alert must monitor Kubernetes pod resource type
deny if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_monitoring_alert_policy"
    contains(resource.address, "pod_restart_rate")

    condition := resource.values.conditions[_]
    not contains(condition.condition_threshold.filter, "k8s_pod")
    not contains(condition.condition_threshold.filter, "k8s_container")
}

# Pod restart rate alert must monitor restart metrics
deny if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_monitoring_alert_policy"
    contains(resource.address, "pod_restart_rate")

    condition := resource.values.conditions[_]
    not contains(condition.condition_threshold.filter, "restart")
}

# Pod restart rate threshold should not exceed 10 restarts per period
deny if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_monitoring_alert_policy"
    contains(resource.address, "pod_restart_rate")

    condition := resource.values.conditions[_]
    condition.condition_threshold.threshold_value > 10
}
