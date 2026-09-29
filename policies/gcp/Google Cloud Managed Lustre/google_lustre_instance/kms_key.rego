package terraform.gcp.security.lustre.google_lustre_instance.kms_key

import data.terraform.helpers
import data.terraform.gcp.security.lustre.google_lustre_instance.vars

conditions := [
    [
        {
            "situation_description": "The Lustre instance does not have a customer-managed encryption key configured.",
            "remedies": [
                "Set 'kms_key' to a valid Google Cloud KMS crypto key resource name."
            ]
        },
        {
            "condition": "'kms_key' must not be empty or unset.",
            "attribute_path": ["kms_key"],
            "values": [null, ""],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details