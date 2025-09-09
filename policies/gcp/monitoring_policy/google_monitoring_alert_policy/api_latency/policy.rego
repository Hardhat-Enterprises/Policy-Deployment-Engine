package terraform.analysis.api_latency

import future.keywords.contains
import future.keywords.if
import future.keywords.in

default deny = false

# API Latency specific validations
deny if {
# API latency alerts must monitor App Engine or Load Balancer metrics
resource := input.planned_values.root_module.resources[_]
resource.type == "google_monitoring_alert_policy"
contains(resource.address, "api_latency")

# Use a named variable to safely iterate over conditions
condition := resource.values.conditions[_]

not contains(condition.condition_threshold.filter, "appengine")
not contains(condition.condition_threshold.filter, "http_load_balancer")

}

deny if {
# API latency threshold should not exceed 5 seconds
resource := input.planned_values.root_module.resources[_]
resource.type == "google_monitoring_alert_policy"
contains(resource.address, "api_latency")

# Use a named variable to safely iterate over conditions
condition := resource.values.conditions[_]

condition.condition_threshold.threshold_value > 5.0

}

deny if {
# API latency alert documentation must mention latency monitoring
resource := input.planned_values.root_module.resources[_]
resource.type == "google_monitoring_alert_policy"
contains(resource.address, "api_latency")
not contains(resource.values.documentation.content, "latency")
}