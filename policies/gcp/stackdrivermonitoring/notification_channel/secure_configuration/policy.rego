package terraform.gcp.security.monitoring.notification_channel.secure_configuration

# Get all notification channels from the plan
notification_channels contains resource if {
    resource := input.planned_values.root_module.resources[_]
    resource.type == "google_monitoring_notification_channel"
}

# VIOLATION CHECKS

# Check for public email addresses for security notifications
public_email_addresses contains resource if {
    resource := notification_channels[_]
    resource.values.type == "email"
    email := resource.values.labels.email_address
    contains(email, "@gmail.com")
}

public_email_addresses contains resource if {
    resource := notification_channels[_]
    resource.values.type == "email"
    email := resource.values.labels.email_address
    contains(email, "@yahoo.com")
}

public_email_addresses contains resource if {
    resource := notification_channels[_]
    resource.values.type == "email"
    email := resource.values.labels.email_address
    contains(email, "@hotmail.com")
}

# Check for missing or empty email configuration
missing_email_config contains resource if {
    resource := notification_channels[_]
    resource.values.type == "email"
    not resource.values.labels.email_address
}

empty_email_config contains resource if {
    resource := notification_channels[_]
    resource.values.type == "email"
    resource.values.labels.email_address == ""
}

# Check for insecure Slack webhook URLs
insecure_slack_urls contains resource if {
    resource := notification_channels[_]
    resource.values.type == "slack"
    url := resource.values.labels.url
    startswith(url, "http://")
}

# Check for missing Slack channel configuration
missing_slack_channel contains resource if {
    resource := notification_channels[_]
    resource.values.type == "slack"
    not resource.values.labels.channel_name
}

empty_slack_channel contains resource if {
    resource := notification_channels[_]
    resource.values.type == "slack"
    resource.values.labels.channel_name == ""
}

# Check for invalid phone numbers for SMS
invalid_phone_numbers contains resource if {
    resource := notification_channels[_]
    resource.values.type == "sms"
    number := resource.values.labels.number
    number == "000-000-0000"
}

missing_phone_numbers contains resource if {
    resource := notification_channels[_]
    resource.values.type == "sms"
    not resource.values.labels.number
}

empty_phone_numbers contains resource if {
    resource := notification_channels[_]
    resource.values.type == "sms"
    resource.values.labels.number == ""
}

# Count violations
violation_count := count(public_email_addresses) + count(missing_email_config) + count(empty_email_config) + count(insecure_slack_urls) + count(missing_slack_channel) + count(empty_slack_channel) + count(invalid_phone_numbers) + count(missing_phone_numbers) + count(empty_phone_numbers)

# SUMMARY OUTPUT
summary := {
    "total_resources": count(input.planned_values.root_module.resources),
    "notification_channels": count(notification_channels),
    "violations": {
        "public_email_addresses": count(public_email_addresses),
        "missing_email_config": count(missing_email_config),
        "empty_email_config": count(empty_email_config),
        "insecure_slack_urls": count(insecure_slack_urls),
        "missing_slack_channel": count(missing_slack_channel),
        "empty_slack_channel": count(empty_slack_channel),
        "invalid_phone_numbers": count(invalid_phone_numbers),
        "missing_phone_numbers": count(missing_phone_numbers),
        "empty_phone_numbers": count(empty_phone_numbers)
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
            "type": "public_email_addresses",
            "count": count(public_email_addresses),
            "message": "Security notifications should use corporate email addresses, not public email services",
            "resources": public_email_addresses
        },
        {
            "type": "missing_email_config",
            "count": count(missing_email_config),
            "message": "Email notification channels must have valid email addresses configured",
            "resources": missing_email_config
        },
        {
            "type": "empty_email_config",
            "count": count(empty_email_config),
            "message": "Email notification channels cannot have empty email addresses",
            "resources": empty_email_config
        },
        {
            "type": "insecure_slack_urls",
            "count": count(insecure_slack_urls),
            "message": "Slack notification channels should use secure HTTPS webhook URLs",
            "resources": insecure_slack_urls
        },
        {
            "type": "missing_slack_channel",
            "count": count(missing_slack_channel),
            "message": "Slack notification channels must have channel names configured",
            "resources": missing_slack_channel
        },
        {
            "type": "empty_slack_channel",
            "count": count(empty_slack_channel),
            "message": "Slack notification channels cannot have empty channel names",
            "resources": empty_slack_channel
        },
        {
            "type": "invalid_phone_numbers",
            "count": count(invalid_phone_numbers),
            "message": "SMS notification channels must have valid phone numbers configured",
            "resources": invalid_phone_numbers
        },
        {
            "type": "missing_phone_numbers",
            "count": count(missing_phone_numbers),
            "message": "SMS notification channels must have phone numbers configured",
            "resources": missing_phone_numbers
        },
        {
            "type": "empty_phone_numbers",
            "count": count(empty_phone_numbers),
            "message": "SMS notification channels cannot have empty phone numbers",
            "resources": empty_phone_numbers
        }
    ]
}