package terraform.gcp.security.lustre.google_lustre_instance.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.lustre.google_lustre_instance.vars

conditions := [
    [
        {
            "situation_description": "The Lustre instance deletion policy does not prevent destructive deletion.",
            "remedies": [
                "Set 'deletion_policy' to \"PREVENT\" or \"ABANDON\" to protect the Lustre instance from destructive deletion."
            ]
        },
        {
            "condition": "'deletion_policy' must be set to PREVENT or ABANDON.",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT", "ABANDON"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details