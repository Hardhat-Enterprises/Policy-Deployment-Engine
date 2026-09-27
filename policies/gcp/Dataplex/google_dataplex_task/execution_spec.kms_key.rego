package terraform.gcp.security.dataplex.google_dataplex_task.execution_spec_kms_key

import data.terraform.helpers
import data.terraform.gcp.security.dataplex.google_dataplex_task.vars

conditions := [
    [
        {
            "situation_description": "Task does not have Customer-Managed Encryption Keys (CMEK) configured - Google-managed keys are used instead",
            "remedies": [
                "Set execution_spec.kms_key to a customer-managed Key Management Service (KMS) key",
                "Example format: projects/PROJECT/locations/REGION/keyRings/RING/cryptoKeys/KEY"
            ]
        },
        {
            "condition": "execution_spec kms_key must be set",
            "attribute_path": ["execution_spec", 0, "kms_key"],
            "values": [null, ""],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "Task kms_key is not a fully qualified Cloud KMS crypto key resource path",
            "remedies": [
                "Use the full KMS resource path, not a bare key name or alias",
                "Example format: projects/PROJECT/locations/REGION/keyRings/RING/cryptoKeys/KEY"
            ]
        },
        {
            "condition": "execution_spec kms_key must be a projects/ KMS resource path",
            "attribute_path": ["execution_spec", 0, "kms_key"],
            "values": ["*", [["projects"]]],
            "policy_type": "pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
