package terraform.analysis

import future.keywords.contains
import future.keywords.if
import future.keywords.in

# Import all specific policy packages
import data.terraform.analysis.api_latency
import data.terraform.analysis.cloudsql_cpu
import data.terraform.analysis.container_cpu_throttling
import data.terraform.analysis.gke_cluster_cpu
import data.terraform.analysis.gke_node_memory
import data.terraform.analysis.instance_uptime
import data.terraform.analysis.lb_error_rate
import data.terraform.analysis.network_egress
import data.terraform.analysis.pod_restart_rate
import data.terraform.analysis.pv_disk_usage

# Default deny
default deny = false

# Helper function to get all resources of a specific type
resources_by_type(type) = resources {
    resources := [r | r := input.planned_values.root_module.resources[_]; r.type == type]
}

# Collect all denials from specific policies
deny[msg] {
    msg := api_latency.deny[_]
}

deny[msg] {
    msg := cloudsql_cpu.deny[_]
}

deny[msg] {
    msg := container_cpu_throttling.deny[_]
}

deny[msg] {
    msg := gke_cluster_cpu.deny[_]
}

deny[msg] {
    msg := gke_node_memory.deny[_]
}

deny[msg] {
    msg := instance_uptime.deny[_]
}

deny[msg] {
    msg := lb_error_rate.deny[_]
}

deny[msg] {
    msg := network_egress.deny[_]
}

deny[msg] {
    msg := pod_restart_rate.deny[_]
}

deny[msg] {
    msg := pv_disk_usage.deny[_]
}

#############################################
# GENERAL POLICY RULES FOR ALL ALERTS
#############################################

# All alert policies must have display names
deny[msg] {
    resources := resources_by_type("google_monitoring_alert_policy")
    resource := resources[_]
    not resource.values.display_name
    msg := sprintf("Alert policy '%s' must have a display_name", [resource.address])
}

deny[msg] {
    resources := resources_by_type("google_monitoring_alert_policy")
    resource := resources[_]
    resource.values.display_name == ""
    msg := sprintf("Alert policy '%s' must have a non-empty display_name", [resource.address])
}

# All alert policies must have at least one condition
deny[msg] {
    resources := resources_by_type("google_monitoring_alert_policy")
    resource := resources[_]
    count(resource.values.conditions) == 0
    msg := sprintf("Alert policy '%s' must have at least one condition", [resource.address])
}

# All alert policies must have notification channels
deny[msg] {
    resources := resources_by_type("google_monitoring_alert_policy")
    resource := resources[_]
    not resource.values.notification_channels
    msg := sprintf("Alert policy '%s' must have notification_channels configured", [resource.address])
}

deny[msg] {
    resources := resources_by_type("google_monitoring_alert_policy")
    resource := resources[_]
    count(resource.values.notification_channels) == 0
    msg := sprintf("Alert policy '%s' must have at least one notification channel", [resource.address])
}

# All alert policies must have documentation
deny[msg] {
    resources := resources_by_type("google_monitoring_alert_policy")
    resource := resources[_]
    not resource.values.documentation
    msg := sprintf("Alert policy '%s' must have documentation", [resource.address])
}

deny[msg] {
    resources := resources_by_type("google_monitoring_alert_policy")
    resource := resources[_]
    not resource.values.documentation.content
    msg := sprintf("Alert policy '%s' must have documentation content", [resource.address])
}

# Project ID validation
deny[msg] {
    resources := resources_by_type("google_monitoring_alert_policy")
    resource := resources[_]
    resource.values.project != "fluent-coder-468700-h4"
    msg := sprintf("Alert policy '%s' must be in project 'fluent-coder-468700-h4'", [resource.address])
}

# Required labels
required_labels := ["environment", "managed_by", "project"]

deny[msg] {
    resources := resources_by_type("google_monitoring_alert_policy")
    resource := resources[_]
    not resource.values.user_labels
    msg := sprintf("Alert policy '%s' must have user_labels", [resource.address])
}

deny[msg] {
    resources := resources_by_type("google_monitoring_alert_policy")
    resource := resources[_]
    required_label := required_labels[_]
    not resource.values.user_labels[required_label]
    msg := sprintf("Alert policy '%s' missing required label: %s", [resource.address, required_label])
}

# Cost center validation
deny[msg] {
    resources := resources_by_type("google_monitoring_alert_policy")
    resource := resources[_]
    resource.values.user_labels.cost_center != "engineering"
    msg := sprintf("Alert policy '%s' must have cost_center label set to 'engineering'", [resource.address])
}

# Critical alerts must have auto_close strategy
deny[msg] {
    resources := resources_by_type("google_monitoring_alert_policy")
    resource := resources[_]
    resource.values.user_labels.severity == "critical"
    not resource.values.alert_strategy
    msg := sprintf("Critical alert policy '%s' must have an alert_strategy", [resource.address])
}

deny[msg] {
    resources := resources_by_type("google_monitoring_alert_policy")
    resource := resources[_]
    resource.values.user_labels.severity == "critical"
    not resource.values.alert_strategy.auto_close
    msg := sprintf("Critical alert policy '%s' must have auto_close configured in alert_strategy", [resource.address])
}

# Validate combiner values
valid_combiners := ["AND", "OR", "AND_WITH_MATCHING_RESOURCE"]

deny[msg] {
    resources := resources_by_type("google_monitoring_alert_policy")
    resource := resources[_]
    not resource.values.combiner in valid_combiners
    msg := sprintf("Alert policy '%s' has invalid combiner: %s. Must be one of: %v", 
                   [resource.address, resource.values.combiner, valid_combiners])
}

# Minimum number of policies
total_policies := count(resources_by_type("google_monitoring_alert_policy"))
total_channels := count(resources_by_type("google_monitoring_notification_channel"))

deny[msg] {
    total_policies < 10
    msg := sprintf("Must have at least 10 monitoring policies, found %d", [total_policies])
}

deny[msg] {
    total_channels == 0
    msg := "Must have at least one notification channel configured"
}

# Validation summary
validation_summary = {
    "total_alert_policies": total_policies,
    "total_notification_channels": total_channels,
    "has_minimum_policies": total_policies >= 10,
    "has_notification_channels": total_channels > 0,
    "validation_passed": count(deny) == 0
}