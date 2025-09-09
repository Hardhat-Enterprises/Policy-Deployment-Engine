package terraform.gcp.security.monitoring.alert_policy.failed_authentication

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

# Check if alert policy is disabled
alert_disabled contains resource if {
    resource := alert_policies[_]
    resource.values.enabled == false
}

# Check for missing notification channels
missing_notifications contains resource if {
    resource := alert_policies[_]
    count(resource.values.notification_channels) == 0
}

# Check for high authentication failure threshold (>50)
high_auth_threshold contains resource if {
    resource := alert_policies[_]
    threshold := resource.values.conditions[_].condition_threshold[_].threshold_value
    threshold > 50
}

# Check for long detection duration (>600s = 10 minutes)
long_detection contains resource if {
    resource := alert_policies[_]
    duration := resource.values.conditions[_].condition_threshold[_].duration
    duration_seconds := parse_duration(duration)
    duration_seconds > 600
}

# Check for long alignment period (>300s = 5 minutes)
long_alignment contains resource if {
    resource := alert_policies[_]
    period := resource.values.conditions[_].condition_threshold[_].aggregations[_].alignment_period
    period_seconds := parse_duration(period)
    period_seconds > 300
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

# Check for missing alert strategy
missing_alert_strategy contains resource if {
    resource := alert_policies[_]
    not resource.values.alert_strategy
}

# Check for wrong combiner (should be OR for auth alerts)
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
violation_count := count(alert_disabled) + count(missing_notifications) + count(high_auth_threshold) + count(long_detection) + count(long_alignment) + count(disabled_channels) + count(insecure_email) + count(missing_alert_strategy) + count(wrong_combiner)

# SUMMARY OUTPUT
summary := {
    "total_resources": count(input.planned_values.root_module.resources),
    "alert_policies": count(alert_policies),
    "notification_channels": count(notification_channels),
    "violations": {
        "alert_disabled": count(alert_disabled),
        "missing_notifications": count(missing_notifications),
        "high_auth_threshold": count(high_auth_threshold),
        "long_detection": count(long_detection),
        "long_alignment": count(long_alignment),
        "disabled_channels": count(disabled_channels),
        "insecure_email": count(insecure_email),
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
            "message": "Failed authentication alert policies must be enabled for security monitoring",
            "resources": alert_disabled
        },
        {
            "type": "missing_notifications",
            "count": count(missing_notifications),
            "message": "Authentication alerts must have notification channels for incident response",
            "resources": missing_notifications
        },
        {
            "type": "high_auth_threshold",
            "count": count(high_auth_threshold),
            "message": "Authentication failure threshold should be low (≤50) to detect brute force attacks",
            "resources": high_auth_threshold
        },
        {
            "type": "long_detection",
            "count": count(long_detection),
            "message": "Authentication failure detection should be quick (≤10 minutes) for timely response",
            "resources": long_detection
        },
        {
            "type": "long_alignment",
            "count": count(long_alignment),
            "message": "Alignment period should be ≤5 minutes for accurate authentication monitoring",
            "resources": long_alignment
        },
        {
            "type": "disabled_channels",
            "count": count(disabled_channels),
            "message": "Notification channels should be enabled for security incident response",
            "resources": disabled_channels
        },
        {
            "type": "insecure_email",
            "count": count(insecure_email),
            "message": "Use corporate email addresses for security notifications, not public email services",
            "resources": insecure_email
        },
        {
            "type": "missing_alert_strategy",
            "count": count(missing_alert_strategy),
            "message": "Authentication alerts must have alert strategy configured",
            "resources": missing_alert_strategy
        },
        {
            "type": "wrong_combiner",
            "count": count(wrong_combiner),
            "message": "Use OR combiner for authentication alerts to ensure proper detection",
            "resources": wrong_combiner
        }
    ]
}