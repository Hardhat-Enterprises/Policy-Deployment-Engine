package terraform.analysis.gke_node_memory

import future.keywords.contains
import future.keywords.if

default deny = false

# GKE node memory alert must monitor GKE node resource type
deny if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_monitoring_alert_policy"
    contains(resource.address, "gke_node_memory")

    condition := resource.values.conditions[_]
    not contains(condition.condition_threshold.filter, "gke_node")
    not contains(condition.condition_threshold.filter, "k8s_node")
}

# GKE node alert must monitor memory metrics
deny if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_monitoring_alert_policy"
    contains(resource.address, "gke_node_memory")

    condition := resource.values.conditions[_]
    not contains(condition.condition_threshold.filter, "memory")
}

# GKE node memory threshold should not exceed 90%
deny if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_monitoring_alert_policy"
    contains(resource.address, "gke_node_memory")

    condition := resource.values.conditions[_]
    condition.condition_threshold.threshold_value > 0.9
}
