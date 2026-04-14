package terraform.gcp.security.cloud_composer.google_composer_environment.cmek_required

import data.terraform.helpers
import data.terraform.gcp.security.cloud_composer.google_composer_environment.vars

conditions := [

    [
        {
            "situation_description": "The Cloud Composer environment is not using a customer-managed encryption key (CMEK) for sensitive data.",
            "remedies": [
                "Assign a customer-managed KMS key via `encryption_config.kms_key_name`.",
                "Ensure the key has proper IAM permissions and rotation policies."
            ]
        },
        {
            "condition": "Check if CMEK is configured",
            "attribute_path": ["config", 0, "encryption_config", 0, "kms_key_name"],
            "values": [""],  # Empty string indicates CMEK not configured
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details