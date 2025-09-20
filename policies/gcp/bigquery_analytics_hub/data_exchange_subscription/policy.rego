package terraform.gcp.security.analytics_hub.data_exchange_subscription.naming_standard

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analytics_hub.data_exchange_subscription.vars

# Define conditions for compliance
conditions := [
    [
        {
            "situation_description": "Subscription ID must only contain lowercase letters, numbers, and underscores.",
            "remedies": [
                "Rename subscription_id to follow pattern ^[a-z0-9_]+$",
                "Avoid uppercase, spaces, or special characters"
            ]
        },
        {
            "condition": "Check subscription_id follows allowed naming pattern",
            "attribute_path": ["subscription_id"],
            "values": ["^[a-z0-9_]+$"],
            "policy_type": "pattern whitelist"
        }
    ],
    [
        {
            "situation_description": "Subscriber contact must be a valid email format.",
            "remedies": [
                "Ensure subscriber_contact is a valid email",
                "Fix invalid or missing contact values"
            ]
        },
        {
            "condition": "Check if subscriber_contact is valid email",
            "attribute_path": ["subscriber_contact"],
            "values": ["^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"],
            "policy_type": "pattern whitelist"
        }
    ],
    [
        {
            "situation_description": "Destination dataset must include at least one label for ownership or environment.",
            "remedies": [
                "Add dataset labels like environment=production or owner=team-x",
                "Ensure labels field is not empty"
            ]
        },
        {
            "condition": "Check if destination_dataset.labels contains required keys",
            "attribute_path": ["destination_dataset", "labels"],
            "values": ["environment","owner"],
            "policy_type": "whitelist"
        }
    ]
]

# General compliance summary
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed evaluation output
details := helpers.get_multi_summary(conditions, vars.variables).details
