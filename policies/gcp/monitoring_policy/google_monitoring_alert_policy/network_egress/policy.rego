package terraform.analysis.network_egress

import future.keywords.contains
import future.keywords.if

default deny = false

# Network egress alert must monitor GCE instance or VPC network metrics
deny if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_monitoring_alert_policy"
    contains(resource.address, "network_egress")

    condition := resource.values.conditions[_]
    not contains(condition.condition_threshold.filter, "gce_instance")
    not contains(condition.condition_threshold.filter, "vpc")
}

# Network egress alert must monitor egress or sent bytes metrics
deny if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_monitoring_alert_policy"
    contains(resource.address, "network_egress")

    condition := resource.values.conditions[_]
    not contains(condition.condition_threshold.filter, "sent_bytes")
    not contains(condition.condition_threshold.filter, "egress")
}

# Network egress threshold should be at least 1MB for meaningful alerting
deny if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_monitoring_alert_policy"
    contains(resource.address, "network_egress")

    condition := resource.values.conditions[_]
    condition.condition_threshold.threshold_value < 1000000
}
