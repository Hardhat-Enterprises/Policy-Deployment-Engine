package terraform.gcp.security.firestore_database.location_id

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firestore.vars

conditions := [
    [
        {
            "situation_description": "Firestore databases must be deployed in the 'nam5' location to comply with organizational residency requirements.",
            "remedies": [
                "Set `location_id = 'nam5'` in the google_firestore_database resource block."
            ]
        },
        {
            "condition": "Checks if location_id is nam5",
            "attribute_path": ["location_id"],
            "values": ["nam5"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details