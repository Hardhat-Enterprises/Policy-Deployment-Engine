package terraform.gcp.security.monitoring.notification_channel.channel_types

# Get all notification channels from the plan
notification_channels contains resource if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_monitoring_notification_channel"
}

# VIOLATION CHECKS

# Check for unsupported or insecure notification channel types
unsupported_channel_types contains resource if {
    resource := notification_channels[_]
    resource.values.type == "webhook"
}

unsupported_channel_types contains resource if {
    resource := notification_channels[_]
    resource.values.type == "http"
}

unsupported_channel_types contains resource if {
    resource := notification_channels[_]
    resource.values.type == "custom"
}

# Check for missing notification channel type
missing_channel_type contains resource if {
    resource := notification_channels[_]
    not resource.values.type
}

# Check for empty notification channel type
empty_channel_type contains resource if {
    resource := notification_channels[_]
    resource.values.type == ""
}

# Count violations
violation_count := count(unsupported_channel_types) + count(missing_channel_type) + count(empty_channel_type)

# SUMMARY OUTPUT
summary := {
    "total_resources": count(input.planned_values.root_module.resources),
    "notification_channels": count(notification_channels),
    "violations": {
        "unsupported_channel_types": count(unsupported_channel_types),
        "missing_channel_type": count(missing_channel_type),
        "empty_channel_type": count(empty_channel_type)
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
            "type": "unsupported_channel_types",
            "count": count(unsupported_channel_types),
            "message": "Use supported and secure notification channel types (email, slack, sms, pagerduty) for reliable incident response",
            "resources": unsupported_channel_types
        },
        {
            "type": "missing_channel_type",
            "count": count(missing_channel_type),
            "message": "Notification channels must have a valid type specified",
            "resources": missing_channel_type
        },
        {
            "type": "empty_channel_type",
            "count": count(empty_channel_type),
            "message": "Notification channel type cannot be empty",
            "resources": empty_channel_type
        }
    ]
}