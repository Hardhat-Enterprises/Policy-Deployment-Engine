package terraform.gcp.security.monitoring.threshold_validation

# Get all monitoring alert policies from the plan
alert_policies contains resource if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_monitoring_alert_policy"
}

# VIOLATION CHECKS

# Check for unreasonably high security thresholds (>1000)
high_security_thresholds contains resource if {
    resource := alert_policies[_]
    threshold := resource.values.conditions[_].condition_threshold[_].threshold_value
    threshold > 1000
}

# Check for missing threshold configuration
missing_threshold contains resource if {
    resource := alert_policies[_]
    not resource.values.conditions[_].condition_threshold[_].threshold_value
}

# Check for zero threshold (ineffective)
zero_threshold contains resource if {
    resource := alert_policies[_]
    threshold := resource.values.conditions[_].condition_threshold[_].threshold_value
    threshold == 0
}

# Check for inappropriate comparison operator
wrong_comparison contains resource if {
    resource := alert_policies[_]
    comparison := resource.values.conditions[_].condition_threshold[_].comparison
    comparison == "COMPARISON_LT"
}

# Check for missing comparison operator
missing_comparison contains resource if {
    resource := alert_policies[_]
    not resource.values.conditions[_].condition_threshold[_].comparison
}

# Count violations
violation_count := count(high_security_thresholds) + count(missing_threshold) + count(zero_threshold) + count(wrong_comparison) + count(missing_comparison)

# SUMMARY OUTPUT
summary := {
    "total_resources": count(input.planned_values.root_module.resources),
    "alert_policies": count(alert_policies),
    "violations": {
        "high_security_thresholds": count(high_security_thresholds),
        "missing_threshold": count(missing_threshold),
        "zero_threshold": count(zero_threshold),
        "wrong_comparison": count(wrong_comparison),
        "missing_comparison": count(missing_comparison)
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
            "type": "high_security_thresholds",
            "count": count(high_security_thresholds),
            "message": "Security monitoring thresholds should be low enough to detect threats early but not cause alert fatigue",
            "resources": high_security_thresholds
        },
        {
            "type": "missing_threshold",
            "count": count(missing_threshold),
            "message": "Security alert policies must have properly configured threshold values",
            "resources": missing_threshold
        },
        {
            "type": "zero_threshold",
            "count": count(zero_threshold),
            "message": "Zero thresholds are ineffective for security monitoring and should be avoided",
            "resources": zero_threshold
        },
        {
            "type": "wrong_comparison",
            "count": count(wrong_comparison),
            "message": "Security monitoring should use appropriate comparison operators (typically COMPARISON_GT for violations)",
            "resources": wrong_comparison
        },
        {
            "type": "missing_comparison",
            "count": count(missing_comparison),
            "message": "Security alert policies must have comparison operators configured",
            "resources": missing_comparison
        }
    ]
}