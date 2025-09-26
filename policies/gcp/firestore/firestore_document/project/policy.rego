package terraform.gcp.security.firestore_document.project

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firestore.firestore_document.vars

conditions := [
    [
        {
            "situation_description": "Firestore documents must reside in project 'c' to comply with organizational project governance.",
            "remedies": [
                "Set `project = 'c'` in the google_firestore_document resource block."
            ]
        },
        {
            "condition": "Checks if project is c",
            "attribute_path": ["project"],
            "values": ["c"],
            "policy_type": "whitelist"
        }
    ]
]
summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details