package terraform.gcp.security.compute_engine.google_compute_interconnect.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_interconnect.vars

conditions := [
    [
        {
            "situation_description": "Interconnect must be protected from accidental or unauthorised deletion via Terraform.",
            "remedies": [
                "Set deletion_policy to 'PREVENT'.",
                "The default 'DELETE' allows a 'terraform destroy'/'apply' to remove the interconnect, and everything routed over it, without any safeguard."
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
