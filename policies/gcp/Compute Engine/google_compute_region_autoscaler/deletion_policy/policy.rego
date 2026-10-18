package terraform.gcp.security.compute_engine.google_compute_region_autoscaler.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_autoscaler.vars

conditions := [
    [
        {
            "situation_description": "The autoscaler's deletion_policy allows the resource to be destroyed via terraform destroy or apply, risking accidental removal of active scaling management.",
            "remedies": [
                "Set deletion_policy to PREVENT in the google_compute_region_autoscaler resource.",
                "This blocks accidental deletion via terraform destroy or apply.",
                "Consult Google Cloud documentation on deletion_policy for details."
            ]
        },
        {
            "condition": "Check if deletion_policy is set to PREVENT",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "Whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
