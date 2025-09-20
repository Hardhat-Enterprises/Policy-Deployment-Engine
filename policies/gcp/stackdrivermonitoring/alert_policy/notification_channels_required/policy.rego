package terraform.gcp.security.stackdrivermonitoring.alert_policy.notification_channels_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.stackdrivermonitoring.alert_policy.vars

conditions := [
    [
        {
            "situation_description": "Notification channels are missing",
            "remedies": [
                "Configure notification_channels with valid channel IDs",
                "Ensure incident response capability"
            ]
        },
        {
            "condition": "Require notification channels (blacklist: empty array)",
            "attribute_path": ["notification_channels"],
            "values": [[], null],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details