package terraform.gcp.security.compute_engine.google_compute_instance_group_named_port.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_instance_group_named_port.vars

conditions := [
    [
        {
            "situation_description": "Instance Group Named Port is not protected from Terraform deletion",
            "remedies": [
                "Set deletion_policy to PREVENT to protect the resource from unintended destruction"
            ]
        },
        {
            "condition": "Deletion policy must prevent Terraform from destroying the resource",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details