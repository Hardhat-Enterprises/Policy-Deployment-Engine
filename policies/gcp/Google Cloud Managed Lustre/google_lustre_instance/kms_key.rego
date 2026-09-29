package terraform.gcp.security.lustre.google_lustre_instance.kms_key

import data.terraform.helpers
import data.terraform.gcp.security.lustre.google_lustre_instance.vars

conditions := [
    [
        {
            "situation_description": "The Lustre instance does not have a customer-managed encryption key configured.",
            "remedies": [
                "Set 'kms_key' to a valid Google Cloud KMS key resource name.",
                "Use the format projects/{project}/locations/{location}/keyRings/{keyRing}/cryptoKeys/{cryptoKey}."
            ]
        },
        {
            "condition": "'kms_key' must not be empty or unset.",
            "attribute_path": ["kms_key"],
            "values": [null, ""],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "The Lustre instance KMS key reference does not follow the required Google Cloud KMS resource name format.",
            "remedies": [
                "Use a structurally valid customer-managed KMS key reference.",
                "Use the format projects/{project}/locations/{location}/keyRings/{keyRing}/cryptoKeys/{cryptoKey}."
            ]
        },
        {
            "condition": "'kms_key' must follow the Google Cloud KMS crypto key resource name format.",
            "attribute_path": ["kms_key"],
            "values": [
                "projects/*/locations/*/keyRings/*/cryptoKeys/*"
            ],
            "policy_type": "element pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details