package terraform.analysis.pv_disk_usage

import future.keywords.contains
import future.keywords.if

default deny = false

# PV disk usage alert must monitor Kubernetes volume or GCE disk
deny if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_monitoring_alert_policy"
    contains(resource.address, "pv_disk_usage")

    condition := resource.values.conditions[_]
    not contains(condition.condition_threshold.filter, "k8s_volume")
    not contains(condition.condition_threshold.filter, "gce_disk")
}

# PV disk usage alert must monitor disk utilization or used bytes
deny if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_monitoring_alert_policy"
    contains(resource.address, "pv_disk_usage")

    condition := resource.values.conditions[_]
    not contains(condition.condition_threshold.filter, "utilization")
    not contains(condition.condition_threshold.filter, "used_bytes")
}

# PV disk usage threshold should not exceed 90% to prevent disk full
deny if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_monitoring_alert_policy"
    contains(resource.address, "pv_disk_usage")

    condition := resource.values.conditions[_]
    condition.condition_threshold.threshold_value > 0.9
}
