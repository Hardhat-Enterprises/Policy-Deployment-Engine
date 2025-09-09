package terraform.analysis.gke_cluster_cpu

import future.keywords.contains
import future.keywords.if

default deny = false

# GKE cluster CPU alert must monitor GKE cluster resource type
deny if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_monitoring_alert_policy"
    contains(resource.address, "gke_cluster_cpu")

    condition := resource.values.conditions[_]
    not contains(condition.condition_threshold.filter, "gke_cluster")
    not contains(condition.condition_threshold.filter, "k8s_cluster")
}

# GKE cluster alert must monitor CPU metrics
deny if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_monitoring_alert_policy"
    contains(resource.address, "gke_cluster_cpu")

    condition := resource.values.conditions[_]
    not contains(condition.condition_threshold.filter, "cpu")
}

# GKE cluster CPU alert should have critical severity for production clusters
deny if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_monitoring_alert_policy"
    contains(resource.address, "gke_cluster_cpu")

    resource.values.user_labels.severity != "critical"
}
