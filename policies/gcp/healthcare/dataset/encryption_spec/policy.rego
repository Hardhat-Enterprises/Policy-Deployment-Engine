package terraform.gcp.security.healthcare.dataset.encryption_spec
import data.terraform.gcp.helpers
import data.terraform.gcp.security.healthcare.dataset.vars

conditions := [
    [
        {
            "situation_description": "KMS key name is not in the required GCP format.",
            "remedies": [
                "Set 'encryption_spec.kms_key_name' to a valid KMS key in the format: 'projects/PROJECT_ID/locations/LOCATION/keyRings/KEY_RING/cryptoKeys/KEY'."
            ]
        },
        {
            "condition": "Invalid KMS key pattern",
            "attribute_path": ["encryption_spec", 0, "kms_key_name"],
            "values": [
                "projects/*/locations/*/keyRings/*/cryptoKeys/*", [[], [], [], [], []]  
            ],
            "policy_type": "pattern whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details