package terraform.gcp.security.monitoring.notification_channel.enabled_status

# Get all notification channels from the plan
notification_channels contains resource if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_monitoring_notification_channel"
}

# VIOLATION CHECKS

# Check for disabled security notification channels
disabled_security_channels contains resource if {
    resource := notification_channels[_]
    resource.values.enabled == false
}

# Check for missing enabled configuration
missing_enabled_status contains resource if {
    resource := notification_channels[_]
    not resource.values.enabled
}

# Count violations
violation_count := count(disabled_security_channels) + count(missing_enabled_status)

# SUMMARY OUTPUT
summary := {
    "total_resources": count(input.planned_values.root_module.resources),
    "notification_channels": count(notification_channels),
    "violations": {
        "disabled_security_channels": count(disabled_security_channels),
        "missing_enabled_status": count(missing_enabled_status)
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
            "type": "disabled_security_channels",
            "count": count(disabled_security_channels),
            "message": "Security notification channels must be enabled to ensure incident response capabilities",
            "resources": disabled_security_channels
        },
        {
            "type": "missing_enabled_status",
            "count": count(missing_enabled_status),
            "message": "Notification channels must have explicit enabled status configured",
            "resources": missing_enabled_status
        }
    ]
}