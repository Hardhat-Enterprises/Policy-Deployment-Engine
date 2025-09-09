package terraform.analysis.instance_uptime

import future.keywords.contains
import future.keywords.if

default deny = false

# Instance uptime alert must monitor GCE instance resource type
deny if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_monitoring_alert_policy"
    contains(resource.address, "instance_uptime")

    condition := resource.values.conditions[_]
    not contains(condition.condition_threshold.filter, "gce_instance")
}

# Instance uptime alert must monitor uptime metrics
deny if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_monitoring_alert_policy"
    contains(resource.address, "instance_uptime")

    condition := resource.values.conditions[_]
    not contains(condition.condition_threshold.filter, "up")
    not contains(condition.condition_threshold.filter, "uptime")
}

# Instance uptime alert should use COMPARISON_LESS_THAN for downtime detection
deny if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_monitoring_alert_policy"
    contains(resource.address, "instance_uptime")

    condition := resource.values.conditions[_]
    condition.comparison != "COMPARISON_LESS_THAN"
}
