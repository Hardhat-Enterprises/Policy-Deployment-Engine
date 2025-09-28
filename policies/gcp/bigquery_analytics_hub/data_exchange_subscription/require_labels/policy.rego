package terraform.gcp.security.analytics_hub.data_exchange_subscription.require_labels

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analytics_hub.data_exchange_subscription.vars

conditions := [
    [
        {
            "situation_description": "c1: Destination dataset must include governance labels for ownership and environment",
            "remedies": [
                "Add dataset labels such as environment=production or owner=team-x",
                "Ensure both 'environment' and 'owner' labels are present on the dataset"
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

# Detailed evaluation
details := helpers.get_multi_summary(conditions, vars.variables).details
