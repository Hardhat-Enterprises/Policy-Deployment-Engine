package terraform.gcp.security.cloud_storage.google_storage_bucket_object.kms_key_name

import data.terraform.helpers
import data.terraform.gcp.security.cloud_storage.google_storage_bucket_object.vars


conditions := [
    [
        {"situation_description": "Encryption of objects is recommended.",
         "remedies": ["No encryption found. Use either kms key block or customer encryption block."]
         },
        {
            "condition": "Encryption should be done.",
            "attribute_path": ["kms_key_name"],
            "values": [null],  
            "policy_type": "blacklist"
        },

        {
            "condition": "Encryption should be done.",
            "attribute_path": ["customer_encryption"],
            "values": [null],  
            "policy_type": "blacklist"
        }
    ],
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message

details := summary.details
