package terraform.gcp.security.firestore_document.collection

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firestore.vars

conditions := [
    [
        {
            "situation_description": "Firestore documents must be placed in the 'my_collection' collection to maintain standardized data organization.",
            "remedies": [
                "Set `collection = 'my_collection'` in the google_firestore_document resource block."
            ]
        },
        {
            "condition": "Checks if collection is my_collection",
            "attribute_path": ["collection"],
            "values": ["my_collection"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details