package terraform.gcp.security.monitoring.alert_configuration

# Get all monitoring alert policies from the plan
alert_policies contains resource if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_monitoring_alert_policy"
}

# VIOLATION CHECKS

# Check if any security alert policy is disabled
disabled_security_alerts contains resource if {
    resource := alert_policies[_]
    resource.values.enabled == false
}

# Check for missing notification channels
missing_notifications contains resource if {
    resource := alert_policies[_]
    count(resource.values.notification_channels) == 0
}

# Check for missing alert strategy
missing_alert_strategy contains resource if {
    resource := alert_policies[_]
    not resource.values.alert_strategy
}

# Check for missing or inadequate documentation
missing_documentation contains resource if {
    resource := alert_policies[_]
    not resource.values.documentation
}

# Check for empty documentation content
empty_documentation contains resource if {
    resource := alert_policies[_]
    resource.values.documentation
    count(resource.values.documentation) > 0
    resource.values.documentation[_].content == ""
}

# Count violations
violation_count := count(disabled_security_alerts) + count(missing_notifications) + count(missing_alert_strategy) + count(missing_documentation) + count(empty_documentation)

# SUMMARY OUTPUT
summary := {
    "total_resources": count(input.planned_values.root_module.resources),
    "alert_policies": count(alert_policies),
    "violations": {
        "disabled_security_alerts": count(disabled_security_alerts),
        "missing_notifications": count(missing_notifications),
        "missing_alert_strategy": count(missing_alert_strategy),
        "missing_documentation": count(missing_documentation),
        "empty_documentation": count(empty_documentation)
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
            "type": "disabled_security_alerts",
            "count": count(disabled_security_alerts),
            "message": "Security monitoring alert policies must be enabled for continuous threat detection",
            "resources": disabled_security_alerts
        },
        {
            "type": "missing_notifications",
            "count": count(missing_notifications),
            "message": "Security alert policies must have notification channels configured for incident response",
            "resources": missing_notifications
        },
        {
            "type": "missing_alert_strategy",
            "count": count(missing_alert_strategy),
            "message": "Security alert policies must have alert strategy configured for proper incident management",
            "resources": missing_alert_strategy
        },
        {
            "type": "missing_documentation",
            "count": count(missing_documentation),
            "message": "Security alert policies must have comprehensive documentation for incident response procedures",
            "resources": missing_documentation
        },
        {
            "type": "empty_documentation",
            "count": count(empty_documentation),
            "message": "Security alert documentation must contain meaningful content for incident response guidance",
            "resources": empty_documentation
        }
    ]
}
            "