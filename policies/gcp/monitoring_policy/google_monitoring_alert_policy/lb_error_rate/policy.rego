package terraform.analysis.lb_error_rate

import future.keywords.contains
import future.keywords.if

default deny = false

# Load balancer error rate alert must monitor HTTP/HTTPS load balancer
deny if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_monitoring_alert_policy"
    contains(resource.address, "lb_error_rate")

    condition := resource.values.conditions[_]
    not contains(condition.condition_threshold.filter, "http_load_balancer")
    not contains(condition.condition_threshold.filter, "https_load_balancer")
}

# Load balancer error rate alert must monitor error metrics
deny if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_monitoring_alert_policy"
    contains(resource.address, "lb_error_rate")

    condition := resource.values.conditions[_]
    not contains(condition.condition_threshold.filter, "error")
    not contains(condition.condition_threshold.filter, "4xx")
    not contains(condition.condition_threshold.filter, "5xx")
}

# Load balancer error rate threshold should not exceed 5%
deny if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_monitoring_alert_policy"
    contains(resource.address, "lb_error_rate")

    condition := resource.values.conditions[_]
    condition.condition_threshold.threshold_value > 0.05
}
