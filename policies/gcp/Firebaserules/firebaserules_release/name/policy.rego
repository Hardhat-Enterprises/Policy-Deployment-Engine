package terraform.gcp.security.firebaserules_release.name

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebaserules.vars

conditions := [
    [
        {
            "situation_description": "Firestore Rules Release must have the fixed name 'cloud.firestore'.",
            "remedies": [
                "Set 'name = \"cloud.firestore\"' in the google_firebaserules_release resource block."
            ]
        },
        {
            "condition": "Checks if name is exactly cloud.firestore",
            "attribute_path": ["name"],
            "values": ["cloud.firestore"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details