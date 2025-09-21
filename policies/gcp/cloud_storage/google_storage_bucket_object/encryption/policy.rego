package terraform.gcp.security.cloud_storage.google_storage_bucket_object.encryption

import data.terraform.gcp.helpers
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
            "attribute_path": ["customer_encryption",0],
            "values": [null],  
            "policy_type": "blacklist"
        }
    ],
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
