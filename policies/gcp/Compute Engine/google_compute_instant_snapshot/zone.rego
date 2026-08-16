package terraform.gcp.security.compute_engine.google_compute_instant_snapshot.zone

import data.terraform.helpers as helpers
import data.terraform.gcp.security.compute_engine.google_compute_instant_snapshot.vars as vars

conditions := [
    [
        {
            "situation_description": "Instant Snapshot is created in a zone outside the approved Australian zone.",
            "remedies": ["Use zone 'australia-southeast1-a' only."]
        },
        {
            "condition": "Zone must be whitelisted",
            "attribute_path": ["zone"],
            "values": ["australia-southeast1-a"],
            "policy_type": "whitelist"
        }
    ]
]
summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
