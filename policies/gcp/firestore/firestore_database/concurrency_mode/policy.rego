package terraform.gcp.security.firestore_database.concurrency_mode

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firestore.vars

conditions := [
    [
        {
            "situation_description": "Firestore databases must use OPTIMISTIC concurrency mode to ensure consistent transaction behavior.",
            "remedies": [
                "Set `concurrency_mode = 'OPTIMISTIC'` in the google_firestore_database resource block."
            ]
        },
        {
            "condition": "Checks if concurrency_mode is OPTIMISTIC",
            "attribute_path": ["concurrency_mode"],
            "values": ["OPTIMISTIC"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details