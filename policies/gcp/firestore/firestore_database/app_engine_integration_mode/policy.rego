package terraform.gcp.security.firestore_database.app_engine_integration_mode

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firestore.vars

conditions := [
    [
        {
            "situation_description": "Firestore databases must disable App Engine integration to avoid unintended coupling.",
            "remedies": [
                "Set `app_engine_integration_mode = 'DISABLED'` in the google_firestore_database resource block."
            ]
        },
        {
            "condition": "Checks if app_engine_integration_mode is DISABLED",
            "attribute_path": ["app_engine_integration_mode"],
            "values": ["DISABLED"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details