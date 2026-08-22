package terraform.gcp.security.compute_engine.google_compute_image.project

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_image.vars

conditions := [
    [
        {
            "situation_description": "Compute Image is being created in an unapproved project.",
            "remedies": ["Set the 'project' attribute to an approved project ID."]
        },
        {
            "condition": "Whitelist approved Project IDs",
            "attribute_path": ["project"],
            "values": ["gcp-project-12345"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details