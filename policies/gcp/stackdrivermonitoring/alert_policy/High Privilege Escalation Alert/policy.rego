package terraform.gcp.security.monitoring.alert_policy.privilege_escalation

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

# Check if critical privilege escalation alert is disabled
alert_disabled contains resource if {
    resource := alert_policies[_]
    resource.values.enabled == false
}

# Check for missing notification channels (critical for privilege escalation)
missing_notifications contains resource if {
    resource := alert_policies[_]
    count(resource.values.notification_channels) == 0
}

# Check for high privilege escalation threshold (should be ≤5)
high_privilege_threshold contains resource if {
    resource := alert_policies[_]
    threshold := resource.values.conditions[_].condition_threshold[_].threshold_value
    threshold > 5
}

# Check for long detection duration (should be ≤120s for critical security)
long_detection contains resource if {
    resource := alert_policies[_]
    duration := resource.values.conditions[_].condition_threshold[_].duration
    duration_seconds := parse_duration(duration)
    duration_seconds > 120
}

# Check for long alignment period (should be ≤60s for privilege escalation)
long_alignment contains resource if {
    resource := alert_policies[_]
    period := resource.values.conditions[_].condition_threshold[_].aggregations[_].alignment_period
    period_seconds := parse_duration(period)
    period_seconds > 60
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

# Check for missing alert strategy (critical for privilege escalation)
missing_alert_strategy contains resource if {
    resource := alert_policies[_]
    not resource.values.alert_strategy
}

# Check for inappropriate auto-close duration (should be ≤3600s for privilege escalation)
long_auto_close contains resource if {
    resource := alert_policies[_]
    auto_close := resource.values.alert_strategy[_].auto_close
    auto_close_seconds := parse_duration(auto_close)
    auto_close_seconds > 3600
}

# Check for wrong combiner (should be OR for privilege alerts)
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
violation_count := count(alert_disabled) + count(missing_notifications) + count(high_privilege_threshold) + count(long_detection) + count(long_alignment) + count(disabled_channels) + count(insecure_email) + count(missing_alert_strategy) + count(long_auto_close) + count(wrong_combiner)

# SUMMARY OUTPUT
summary := {
    "total_resources": count(input.planned_values.root_module.resources),
    "alert_policies": count(alert_policies),
    "notification_channels": count(notification_channels),
    "violations": {
        "alert_disabled": count(alert_disabled),
        "missing_notifications": count(missing_notifications),
        "high_privilege_threshold": count(high_privilege_threshold),
        "long_detection": count(long_detection),
        "long_alignment": count(long_alignment),
        "disabled_channels": count(disabled_channels),
        "insecure_email": count(insecure_email),
        "missing_alert_strategy": count(missing_alert_strategy),
        "long_auto_close": count(long_auto_close),
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
            "message": "Privilege escalation alerts are CRITICAL and must be enabled",
            "resources": alert_disabled
        },
        {
            "type": "missing_notifications",
            "count": count(missing_notifications),
            "message": "Privilege escalation alerts must have multiple notification channels for immediate response",
            "resources": missing_notifications
        },
        {
            "type": "high_privilege_threshold",
            "count": count(high_privilege_threshold),
            "message": "Privilege escalation threshold must be very low (≤5) - any escalation is suspicious",
            "resources": high_privilege_threshold
        },
        {
            "type": "long_detection",
            "count": count(long_detection),
            "message": "Privilege escalation detection must be immediate (≤2 minutes) for critical security response",
            "resources": long_detection
        },
        {
            "type": "long_alignment",
            "count": count(long_alignment),
            "message": "Alignment period must be ≤1 minute for real-time privilege escalation detection",
            "resources": long_alignment
        },
        {
            "type": "disabled_channels",
            "count": count(disabled_channels),
            "message": "All notification channels must be enabled for privilege escalation alerts",
            "resources": disabled_channels
        },
        {
            "type": "insecure_email",
            "count": count(insecure_email),
            "message": "Critical security alerts must use secure corporate email, not public services",
            "resources": insecure_email
        },
        {
            "type": "missing_alert_strategy",
            "count": count(missing_alert_strategy),
            "message": "Privilege escalation alerts must have comprehensive alert strategy",
            "resources": missing_alert_strategy
        },
        {
            "type": "long_auto_close",
            "count": count(long_auto_close),
            "message": "Privilege escalation alerts should auto-close within 1 hour for proper incident tracking",
            "resources": long_auto_close
        },
        {
            "type": "wrong_combiner",
            "count": count(wrong_combiner),
            "message": "Use OR combiner for privilege escalation alerts to ensure no events are missed",
            "resources": wrong_combiner
        }
    ]
}