package terraform.gcp.security.compute_engine.google_compute_address.deletion_policy
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_address.vars

conditions := [
    [
        {
            "situation_description": "The reserved IP address is not protected from deletion.",
            "remedies": [
                "Set deletion_policy to PREVENT to protect the reserved address from accidental deletion."
            ]
        },
        {
            "condition": "Deletion policy must be PREVENT",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details