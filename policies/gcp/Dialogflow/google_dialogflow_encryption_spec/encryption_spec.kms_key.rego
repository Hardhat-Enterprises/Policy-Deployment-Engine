package terraform.gcp.security.dialogflow.google_dialogflow_encryption_spec.encryption_spec_kms_key

import data.terraform.helpers
import data.terraform.gcp.security.dialogflow.google_dialogflow_encryption_spec.vars

conditions := [
    [
        {
            "situation_description": "A customer-managed encryption key is not configured for the Dialogflow encryption specification.",
            "remedies": [
                "Configure encryption_spec.kms_key with a customer-managed encryption key."
            ]
        },
        {
            "condition": "Check that encryption_spec.kms_key is not empty.",
            "attribute_path": ["encryption_spec", 0, "kms_key"],
            "values": [""],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details