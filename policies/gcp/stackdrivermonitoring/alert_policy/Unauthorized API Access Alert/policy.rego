package terraform.gcp.security.monitoring.alert_policy.unauthorized_api_access

# Get all monitoring alert policies from the plan
alert_policies contains resource if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_monitoring_alert_policy"
}

# Get all notification channels from the plan
notification_channels contains resource if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_monitoring_notification_channel"
}

# VIOLATION CHECKS

# Check if API access monitoring is disabled
alert_disabled contains resource if {
    resource := alert_policies[_]
    resource.values.enabled == false
}

# Check for empty or missing filter
empty_filter contains resource if {
    resource := alert_policies[_]
    condition := resource.values.conditions[_]
    threshold := condition.condition_threshold[_]
    filter := threshold.filter
    filter == ""
}

# Check for high API access threshold (should be ≤10)
high_api_threshold contains resource if {
    resource := alert_policies[_]
    condition := resource.values.conditions[_]
    threshold := condition.condition_threshold[_]
    threshold_value := threshold.threshold_value
    threshold_value > 10
}

# Check for long detection duration (should be ≤300s for API security)
long_detection contains resource if {
    resource := alert_policies[_]
    condition := resource.values.conditions[_]
    threshold := condition.condition_threshold[_]
    duration := threshold.duration
    duration_seconds := parse_duration(duration)
    duration_seconds > 300
}

# Check for long alignment period (should be ≤120s)
long_alignment contains resource if {
    resource := alert_policies[_]
    condition := resource.values.conditions[_]
    threshold := condition.condition_threshold[_]
    aggregation := threshold.aggregations[_]
    period := aggregation.alignment_period
    period_seconds := parse_duration(period)
    period_seconds > 120
}

# Check for disabled notification channels
disabled_channels contains resource if {
    resource := notification_channels[_]
    resource.values.enabled == false
}

# Check for insecure email addresses
insecure_email contains resource if {
    resource := notification_channels[_]
    resource.values.type == "email"
    email := resource.values.labels.email_address
    contains(email, "@gmail.com")
}

# Check for missing cross-series reducer
missing_reducer contains resource if {
    resource := alert_policies[_]
    condition := resource.values.conditions[_]
    threshold := condition.condition_threshold[_]
    aggregation := threshold.aggregations[_]
    not aggregation.cross_series_reducer
}

# Check for missing rate limiting
missing_rate_limit contains resource if {
    resource := alert_policies[_]
    strategy := resource.values.alert_strategy[_]
    not strategy.notification_rate_limit
}

# Check for wrong combiner
wrong_combiner contains resource if {
    resource := alert_policies[_]
    resource.values.combiner == "AND"
}

# HELPER FUNCTIONS

# Parse duration string to seconds
parse_duration(duration_str) := seconds if {
    endswith(duration_str, "s")
    duration_num := trim_suffix(duration_str, "s")
    seconds := to_number(duration_num)
}

# Count violations
violation_count := count(alert_disabled) + count(empty_filter) + count(high_api_threshold) + count(long_detection) + count(long_alignment) + count(disabled_channels) + count(insecure_email) + count(missing_reducer) + count(missing_rate_limit) + count(wrong_combiner)

# SUMMARY OUTPUT
summary := {
    "total_resources": count(input.planned_values.root_module.resources),
    "alert_policies": count(alert_policies),
    "notification_channels": count(notification_channels),
    "violations": {
        "alert_disabled": count(alert_disabled),
        "empty_filter": count(empty_filter),
        "high_api_threshold": count(high_api_threshold),
        "long_detection": count(long_detection),
        "long_alignment": count(long_alignment),
        "disabled_channels": count(disabled_channels),
        "insecure_email": count(insecure_email),
        "missing_reducer": count(missing_reducer),
        "missing_rate_limit": count(missing_rate_limit),
        "wrong_combiner": count(wrong_combiner)
    },
    "total_violations": violation_count,
    "compliance_status": compliance_status,
    "details": violation_details
}

# Determine compliance status
compliance_status := "COMPLIANT" if {
    violation_count == 0
} else := "NON_COMPLIANT" if {
    violation_count > 0
}

# Detailed violation messages
violation_details := details if {
    details := [
        {
            "type": "alert_disabled",
            "count": count(alert_disabled),
            "message": "API access monitoring must be enabled for security protection",
            "resources": alert_disabled
        },
        {
            "type": "empty_filter",
            "count": count(empty_filter),
            "message": "API monitoring must have specific filters to identify unauthorized access",
            "resources": empty_filter
        },
        {
            "type": "high_api_threshold",
            "count": count(high_api_threshold),
            "message": "API access violation threshold should be low (≤10) to detect unauthorized access quickly",
            "resources": high_api_threshold
        },
        {
            "type": "long_detection",
            "count": count(long_detection),
            "message": "API access detection should be rapid (≤5 minutes) for quick threat response",
            "resources": long_detection
        },
        {
            "type": "long_alignment",
            "count": count(long_alignment),
            "message": "Alignment period should be ≤2 minutes for accurate API monitoring",
            "resources": long_alignment
        },
        {
            "type": "disabled_channels",
            "count": count(disabled_channels),
            "message": "Notification channels must be enabled for API security alerts",
            "resources": disabled_channels
        },
        {
            "type": "insecure_email",
            "count": count(insecure_email),
            "message": "Use secure corporate email for API security notifications",
            "resources": insecure_email
        },
        {
            "type": "missing_reducer",
            "count": count(missing_reducer),
            "message": "API monitoring should include cross-series reducer for proper aggregation",
            "resources": missing_reducer
        },
        {
            "type": "missing_rate_limit",
            "count": count(missing_rate_limit),
            "message": "API monitoring should have rate limiting to prevent notification storms",
            "resources": missing_rate_limit
        },
        {
            "type": "wrong_combiner",
            "count": count(wrong_combiner),
            "message": "Use OR combiner for API alerts to ensure no unauthorized access is missed",
            "resources": wrong_combiner
        }
    ]
}