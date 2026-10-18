package terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.parent

import data.terraform.helpers
import data.terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.vars

conditions := [
    [
        {
            "situation_description": "The Data Loss Prevention job trigger is not scoped to an approved regional location.",
            "remedies": [
                "Use the projects/<project>/locations/<location> parent format so the inspection location is explicit.",
                "Set the location segment to a platform-approved region while leaving the owning project project-specific."
            ]
        },
        {
            "condition": "parent must specify a platform-approved regional location",
            "attribute_path": ["parent"],
            "values": [
                "^projects/[^/]+/locations/*$|^projects/[^/]+$",
                [
                    ["australia-southeast1"]
                ]
            ],
            "policy_type": "pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details