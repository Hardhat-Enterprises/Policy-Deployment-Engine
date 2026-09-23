package terraform.gcp.security.dataproc.google_dataproc_autoscaling_policy.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.dataproc.google_dataproc_autoscaling_policy.vars

conditions := [
    [
        {
            "situation_description": "Dataproc Autoscaling Policy deletion is not protected against unintended destruction.",
            "remedies": [
                "Set deletion_policy to PREVENT to protect the Dataproc Autoscaling Policy from unintended deletion."
            ]
        },
        {
            "condition": "Deletion policy must prevent unintended destruction.",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
