package terraform.gcp.security.compute_engine.google_compute_per_instance_config.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_per_instance_config.vars

conditions := [
    [
        {
            "situation_description": "Per-instance config must be protected from accidental or unauthorised deletion via Terraform.",
            "remedies": [
                "Set deletion_policy to 'PREVENT'.",
                "The default 'DELETE' allows a 'terraform destroy'/'apply' to remove this config — and trigger any cascading instance/state removal it controls — without any safeguard."
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
