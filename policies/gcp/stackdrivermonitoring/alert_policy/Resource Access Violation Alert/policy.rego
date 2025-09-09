package terraform.gcp.security.monitoring.alert_policy.resource_access_violation

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

# Check if resource access monitoring is disabled
alert_disabled contains resource if {
    resource := alert_policies[_]
    resource.values.enabled == false
}

# Check for wildcard or overly broad filters
broad_filter contains resource if {
    resource := alert_policies[_]
    filter := resource.values.conditions[_].condition_threshold[_].filter
    filter == "*"
}

# Check for high access violation threshold (should be ≤10)
high_access_threshold contains resource if {
    resource := alert_policies[_]
    threshold := resource.values.conditions[_].condition_threshold[_].threshold_value
    threshold > 10
}

# Check for long detection duration (should be ≤300s for access violations)
long_detection contains resource if {
    resource := alert_policies[_]
    duration := resource.values.conditions[_].condition_threshold[_].duration
    duration_seconds := parse_duration(duration)
    duration_seconds > 300
}

# Check for long alignment period (should be ≤180s)
long_alignment contains resource if {
    resource := alert_policies[_]
    period := resource.values.conditions[_].condition_threshold[_].aggregations[_].alignment_period
    period_seconds := parse_duration(period)
    period_seconds > 180
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

# Check for missing grouping (should group by resource for access monitoring)
missing_grouping contains resource if {
    resource := alert_policies[_]
    aggregations := resource.values.conditions[_].condition_threshold[_].aggregations[_]
    not aggregations.group_by_fields
}

# Check for missing alert strategy
missing_alert_strategy contains resource if {
    resource := alert_policies[_]
    not resource.values.alert_strategy
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
violation_count := count(alert_disabled) + count(broad_filter) + count(high_access_threshold) + count(long_detection) + count(long_alignment) + count(disabled_channels) + count(insecure_email) + count(missing_grouping) + count(missing_alert_strategy) + count(wrong_combiner)

# SUMMARY OUTPUT
summary := {
    "total_resources": count(input.planned_values.root_module.resources),
    "alert_policies": count(alert_policies),
    "notification_channels": count(notification_channels),
    "violations": {
        "alert_disabled": count(alert_disabled),
        "broad_filter": count(broad_filter),
        "high_access_threshold": count(high_access_threshold),
        "long_detection": count(long_detection),
        "long_alignment": count(long_alignment),
        "disabled_channels": count(disabled_channels),
        "insecure_email": count(insecure_email),
        "missing_grouping": count(missing_grouping),
        "missing_alert_strategy": count(missing_alert_strategy),
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
            "message": "Resource access violation monitoring must be enabled for data protection",
            "resources": alert_disabled
        },
        {
            "type": "broad_filter",
            "count": count(broad_filter),
            "message": "Access monitoring filters should target specific resources, not wildcards",
            "resources": broad_filter
        },
        {
            "type": "high_access_threshold",
            "count": count(high_access_threshold),
            "message": "Access violation threshold should be low (≤10) for early unauthorized access detection",
            "resources": high_access_threshold
        },
        {
            "type": "long_detection",
            "count": count(long_detection),
            "message": "Access violation detection should be quick (≤5 minutes) for immediate security response",
            "resources": long_detection
        },
        {
            "type": "long_alignment",
            "count": count(long_alignment),
            "message": "Alignment period should be ≤3 minutes for accurate access monitoring",
            "resources": long_alignment
        },
        {
            "type": "disabled_channels",
            "count": count(disabled_channels),
            "message": "Notification channels must be enabled for access violation alerts",
            "resources": disabled_channels
        },
        {
            "type": "insecure_email",
            "count": count(insecure_email),
            "message": "Use secure corporate email for access violation notifications",
            "resources": insecure_email
        },
        {
            "type": "missing_grouping",
            "count": count(missing_grouping),
            "message": "Access monitoring should group by resource identifiers for proper violation tracking",
            "resources": missing_grouping
        },
        {
            "type": "missing_alert_strategy",
            "count": count(missing_alert_strategy),
            "message": "Access violation alerts must have alert strategy for incident management",
            "resources": missing_alert_strategy
        },
        {
            "type": "wrong_combiner",
            "count": count(wrong_combiner),
            "message": "Use OR combiner for access violation alerts to catch all unauthorized attempts",
            "resources": wrong_combiner
        }
    ]
}