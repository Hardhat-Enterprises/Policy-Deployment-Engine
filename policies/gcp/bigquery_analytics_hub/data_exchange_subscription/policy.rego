package terraform.gcp.security.analytics_hub.data_exchange_subscription.naming_standard

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analytics_hub.data_exchange_subscription.vars

# Define conditions for compliance
conditions := [
    [
        {
            "situation_description": "Subscription ID must only contain lowercase letters, numbers, and underscores, with length 3–50.",
            "remedies": [
                "Rename subscription_id to follow pattern ^[a-z0-9_]{3,50}$",
                "Avoid uppercase, spaces, or special characters"
            ]
        },
        {
            "condition": "Check subscription_id follows allowed naming pattern and length",
            "attribute_path": ["subscription_id"],
            "values": ["^[a-z0-9_]{3,50}$"],
            "policy_type": "regex whitelist"
        }
    ],
    [
        {
            "situation_description": "Subscriber contact must be a valid email format and must not be empty.",
            "remedies": [
                "Ensure subscriber_contact is a valid email",
                "Fix invalid or missing contact values"
            ]
        },
        {
            "condition": "Check if subscriber_contact is valid email and non-empty",
            "attribute_path": ["subscriber_contact"],
            "values": ["^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"],
            "policy_type": "regex whitelist"
        }
    ],
    [
        {
            "situation_description": "Destination dataset must include at least one label for ownership and one for environment.",
            "remedies": [
                "Add dataset labels like environment=production or owner=team-x",
                "Ensure both 'environment' and 'owner' labels are present"
            ]
        },
        {
            "condition": "Check if destination_dataset.labels contains required keys",
            "attribute_path": ["destination_dataset", "labels"],
            "values": ["environment", "owner"],
            "policy_type": "key whitelist"
        }
    ]
]

# General compliance summary
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed evaluation output
details := helpers.get_multi_summary(conditions, vars.variables).details
