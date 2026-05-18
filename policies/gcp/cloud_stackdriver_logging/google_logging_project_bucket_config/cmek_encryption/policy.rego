package terraform.gcp.security.cloud_stackdriver_logging.google_logging_project_bucket_config.cmek_encryption

import data.terraform.helpers
import data.terraform.gcp.security.cloud_stackdriver_logging.google_logging_project_bucket_config.vars

conditions := [
    [
        {
            "situation_description": "Log bucket is not encrypted with Customer-Managed Encryption Key (CMEK)",
            "remedies": [
                "Add cmek_settings block with a valid KMS key name",
                "Use format: projects/YOUR_PROJECT/locations/REGION/keyRings/KEYRING_NAME/cryptoKeys/KEY_NAME"
            ]
        },
        {
            "condition": "Log bucket must have a valid kms_key_name in cmek_settings",
            "attribute_path": ["cmek_settings", 0, "kms_key_name"],
            "values": [null, ""],
            "policy_type": "blacklist"
        }
    ]
]


result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details