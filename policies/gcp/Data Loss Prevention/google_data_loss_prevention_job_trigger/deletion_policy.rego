package terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.data_loss_prevention.google_data_loss_prevention_job_trigger.vars

conditions := [
    [
        {
            "situation_description": "The Data Loss Prevention job trigger is not protected against unintended destructive removal.",
            "remedies": [
                "Set deletion_policy to PREVENT so Terraform cannot destroy the job trigger during normal managed infrastructure changes.",
                "Change deletion protection explicitly only when destruction of the resource has been reviewed and approved."
            ]
        },
        {
            "condition": "deletion_policy must protect the Data Loss Prevention job trigger from destructive loss",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details