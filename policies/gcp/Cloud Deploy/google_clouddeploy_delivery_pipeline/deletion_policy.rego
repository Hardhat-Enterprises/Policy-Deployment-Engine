package terraform.gcp.security.deploy.google_clouddeploy_delivery_pipeline.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.deploy.google_clouddeploy_delivery_pipeline.vars

conditions := [
    [
        {
            "situation_description": "Delivery pipeline deletion policy must prevent Terraform from destroying the pipeline resource.",
            "remedies": [
                "Set deletion_policy to PREVENT.",
                "Using PREVENT blocks accidental Terraform destruction of the managed delivery pipeline."
            ]
        },
        {
            "condition": "deletion_policy is in approved whitelist",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
