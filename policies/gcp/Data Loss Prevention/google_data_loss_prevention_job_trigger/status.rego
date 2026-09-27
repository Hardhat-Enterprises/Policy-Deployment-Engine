package terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.status

import data.terraform.helpers
import data.terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.vars

conditions := [
    [
        {
            "situation_description": "The Data Loss Prevention job trigger is not active, so configured inspection jobs may not be started.",
            "remedies": [
                "Set status to HEALTHY so the job trigger remains active.",
                "Use a documented and time-limited exception process when a trigger must be intentionally paused."
            ]
        },
        {
            "condition": "status must keep the Data Loss Prevention job trigger active",
            "attribute_path": ["status"],
            "values": ["HEALTHY"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details