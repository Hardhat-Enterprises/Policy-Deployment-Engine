package terraform.gcp.security.dialogflow.google_dialogflow_encryption_spec.encryption_spec_kms_key

import data.terraform.helpers
import data.terraform.gcp.security.dialogflow.google_dialogflow_encryption_spec.vars

conditions := [
    [
        {
            "situation_description": "A customer-managed encryption key is not configured for the Dialogflow encryption specification.",
            "remedies": [
                "Configure encryption_spec.kms_key with a customer-managed Cloud KMS key.",
                "Example format: projects/PROJECT/locations/REGION/keyRings/RING/cryptoKeys/KEY"
            ]
        },
        {
            "condition": "encryption_spec.kms_key must be configured.",
            "attribute_path": ["encryption_spec", 0, "kms_key"],
            "values": [null, ""],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "The Dialogflow encryption key is not configured as a fully qualified Cloud KMS crypto key resource path.",
            "remedies": [
                "Use a fully qualified customer-managed Cloud KMS key path.",
                "Example format: projects/PROJECT/locations/REGION/keyRings/RING/cryptoKeys/KEY"
            ]
        },
        {
            "condition": "encryption_spec.kms_key must use a Cloud KMS resource path.",
            "attribute_path": ["encryption_spec", 0, "kms_key"],
            "values": ["*", [["projects"]]],
            "policy_type": "pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details