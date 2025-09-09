package terraform.gcp.security.monitoring.detection_timing

# Get all monitoring alert policies from the plan
alert_policies contains resource if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_monitoring_alert_policy"
}

# VIOLATION CHECKS

# Check for detection duration too long for security threats (>600s = 10 minutes)
long_detection contains resource if {
    resource := alert_policies[_]
    duration := resource.values.conditions[_].condition_threshold[_].duration
    duration_seconds := parse_duration(duration)
    duration_seconds > 600
}

# Check for auto-close duration inappropriate for security incidents (>604800s = 7 days)
inappropriate_auto_close contains resource if {
    resource := alert_policies[_]
    resource.values.alert_strategy
    auto_close := resource.values.alert_strategy[_].auto_close
    auto_close_seconds := parse_duration(auto_close)
    auto_close_seconds > 604800
}

# Check for missing detection duration
missing_detection contains resource if {
    resource := alert_policies[_]
    not resource.values.conditions[_].condition_threshold[_].duration
}

# Check for alignment period too long for security monitoring (>300s = 5 minutes)
long_alignment contains resource if {
    resource := alert_policies[_]
    period := resource.values.conditions[_].condition_threshold[_].aggregations[_].alignment_period
    period_seconds := parse_duration(period)
    period_seconds > 300
}

# Check for missing alignment period
missing_alignment contains resource if {
    resource := alert_policies[_]
    aggregations := resource.values.conditions[_].condition_threshold[_].aggregations[_]
    not aggregations.alignment_period
}

# HELPER FUNCTIONS

# Parse duration string to seconds
parse_duration(duration_str) := seconds if {
    endswith(duration_str, "s")
    duration_num := trim_suffix(duration_str, "s")
    seconds := to_number(duration_num)
}

# Count violations
violation_count := count(long_detection) + count(inappropriate_auto_close) + count(missing_detection) + count(long_alignment) + count(missing_alignment)

# SUMMARY OUTPUT
summary := {
    "total_resources": count(input.planned_values.root_module.resources),
    "alert_policies": count(alert_policies),
    "violations": {
        "long_detection": count(long_detection),
        "inappropriate_auto_close": count(inappropriate_auto_close),
        "missing_detection": count(missing_detection),
        "long_alignment": count(long_alignment),
        "missing_alignment": count(missing_alignment)
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
            "type": "long_detection",
            "count": count(long_detection),
            "message": "Security threat detection should be rapid (≤10 minutes) for timely incident response",
            "resources": long_detection
        },
        {
            "type": "inappropriate_auto_close",
            "count": count(inappropriate_auto_close),
            "message": "Security incident auto-close should balance incident tracking with alert hygiene (≤7 days)",
            "resources": inappropriate_auto_close
        },
        {
            "type": "missing_detection",
            "count": count(missing_detection),
            "message": "Security alert policies must have detection duration configured",
            "resources": missing_detection
        },
        {
            "type": "long_alignment",
            "count": count(long_alignment),
            "message": "Security monitoring alignment period should be frequent (≤5 minutes) for accurate threat detection",
            "resources": long_alignment
        },
        {
            "type": "missing_alignment",
            "count": count(missing_alignment),
            "message": "Security monitoring must have alignment period configured for proper data aggregation",
            "resources": missing_alignment
        }
    ]
}