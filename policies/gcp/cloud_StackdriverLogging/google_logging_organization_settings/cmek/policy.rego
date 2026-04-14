package terraform.gcp.security.cloud_StackdriverLogging.google_logging_organization_settings.cmek

import data.terraform.helpers
import data.terraform.gcp.security.cloud_StackdriverLogging.google_logging_organization_settings.vars

conditions := [
    [
        {
            "situation_description": "Organization logging settings do not use Customer-Managed Encryption Key (CMEK)",
            "remedies": [
                "Set kms_key_name to a valid CMEK key",
                "Format: projects/KEY_PROJECT_ID/locations/LOCATION/keyRings/KEYRING_NAME/cryptoKeys/KEY_NAME",
                "Ensure the key exists and the logging service account has permissions"
            ]
        },
        {
            "condition": "Organization logging must use CMEK encryption",
            "attribute_path": ["kms_key_name"],
            "values": [null, ""],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details