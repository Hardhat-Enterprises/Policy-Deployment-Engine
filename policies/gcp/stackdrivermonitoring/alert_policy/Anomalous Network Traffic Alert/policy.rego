package terraform.gcp.security.monitoring.alert_policy.anomalous_network_traffic

# Standalone policy for Anomalous Network Traffic Alert - modern Rego syntax

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

# Check for overly broad filters
broad_filter contains resource if {
    resource := alert_policies[_]
    filter := resource.values.conditions[_].condition_threshold[_].filter
    filter == "resource.type=\"gce_instance\""
}

# Check for unreasonably high thresholds (>50GB)
high_threshold contains resource if {
    resource := alert_policies[_]
    threshold := resource.values.conditions[_].condition_threshold[_].threshold_value
    threshold > 50000000000
}

# Check for long detection duration (>30 minutes)
long_detection contains resource if {
    resource := alert_policies[_]
    duration := resource.values.conditions[_].condition_threshold[_].duration
    duration_seconds := parse_duration(duration)
    duration_seconds > 1800
}

# Check for long alignment period (>15 minutes)
long_alignment contains resource if {
    resource := alert_policies[_]
    period := resource.values.conditions[_].condition_threshold[_].aggregations[_].alignment_period
    period_seconds := parse_duration(period)
    period_seconds > 900
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
    aggregations := resource.values.conditions[_].condition_threshold[_].aggregations[_]
    not aggregations.cross_series_reducer
}

# Check for AND combiner (should be OR for network alerts)
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
violation_count := count(alert_disabled) + count(broad_filter) + count(high_threshold) + count(long_detection) + count(long_alignment) + count(disabled_channels) + count(insecure_email) + count(missing_reducer) + count(wrong_combiner)

# SUMMARY OUTPUT
summary := {
    "total_resources": count(input.planned_values.root_module.resources),
    "alert_policies": count(alert_policies),
    "notification_channels": count(notification_channels),
    "violations": {
        "alert_disabled": count(alert_disabled),
        "broad_filter": count(broad_filter), 
        "high_threshold": count(high_threshold),
        "long_detection": count(long_detection),
        "long_alignment": count(long_alignment),
        "disabled_channels": count(disabled_channels),
        "insecure_email": count(insecure_email),
        "missing_reducer": count(missing_reducer),
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
            "message": "Alert policies should be enabled for security monitoring",
            "resources": alert_disabled
        },
        {
            "type": "broad_filter", 
            "count": count(broad_filter),
            "message": "Network monitoring filters should be specific, not overly broad",
            "resources": broad_filter
        },
        {
            "type": "high_threshold",
            "count": count(high_threshold), 
            "message": "Network traffic thresholds should be reasonable (≤50GB) to detect anomalies",
            "resources": high_threshold
        },
        {
            "type": "long_detection",
            "count": count(long_detection),
            "message": "Detection duration should be ≤30 minutes for timely threat response", 
            "resources": long_detection
        },
        {
            "type": "long_alignment",
            "count": count(long_alignment),
            "message": "Alignment period should be ≤15 minutes for accurate monitoring",
            "resources": long_alignment
        },
        {
            "type": "disabled_channels",
            "count": count(disabled_channels),
            "message": "Notification channels should be enabled for incident response",
            "resources": disabled_channels
        },
        {
            "type": "insecure_email", 
            "count": count(insecure_email),
            "message": "Use corporate email addresses, not public email services",
            "resources": insecure_email
        },
        {
            "type": "missing_reducer",
            "count": count(missing_reducer),
            "message": "Network monitoring should include cross-series reducer for proper aggregation",
            "resources": missing_reducer
        },
        {
            "type": "wrong_combiner",
            "count": count(wrong_combiner),
            "message": "Use OR combiner for network alerts to avoid missing anomalies",
            "resources": wrong_combiner
        }
    ]
}