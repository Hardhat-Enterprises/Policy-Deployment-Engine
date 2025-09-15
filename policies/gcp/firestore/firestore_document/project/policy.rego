package terraform.gcp.security.firestore_document.project

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firestore.vars

conditions := [
    [
        {
            "situation_description": "Firestore documents must reside in project 'abcd_1234' to comply with organizational project governance.",
            "remedies": [
                "Set `project = 'abcd_1234'` in the google_firestore_document resource block."
            ]
        },
        {
            "condition": "Checks if project is abcd_1234",
            "attribute_path": ["project"],
            "values": ["abcd_1234"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details