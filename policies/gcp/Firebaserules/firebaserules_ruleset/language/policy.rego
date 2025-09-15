package terraform.gcp.security.firebaserules_ruleset.languages

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebaserules.vars

conditions := [
    [
        {
            "situation_description": "google_firebaserules_ruleset source language must be explicitly set to FIREBASE_RULES or EVENT_FLOW_TRIGGERS; default is FIREBASE_RULES.",
            "remedies": [
                "Set 'source.language = \"FIREBASE_RULES\"' (or \"EVENT_FLOW_TRIGGERS\") in the google_firebaserules_ruleset resource block."
            ]
        },
        {
            "condition": "Checks if source.language is one of the allowed values when present",
            "attribute_path": ["source", "language"],
            "values": ["FIREBASE_RULES", "EVENT_FLOW_TRIGGERS"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details