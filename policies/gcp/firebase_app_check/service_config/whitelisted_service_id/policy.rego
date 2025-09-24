package terraform.gcp.security.firebase_app_check.service_config.whitelisted_service_id

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase_app_check.service_config.vars

conditions := [
    [
        {
            "situation_description": "Firebase App Check Service Config service_id is not in the approved whitelist.",
            "remedies": [
                "Set service_id to one of the approved service IDs: firebasestorage.googleapis.com, firebasedatabase.googleapis.com, firestore.googleapis.com, identitytoolkit.googleapis.com."
            ]
        },
        {
            "condition": "Check if service_id is in the approved whitelist",
            "attribute_path": ["service_id"],
            "values": ["firebasestorage.googleapis.com"            ],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details