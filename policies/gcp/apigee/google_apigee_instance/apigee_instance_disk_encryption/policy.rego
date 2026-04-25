package terraform.gcp.security.apigee.google_apigee_instance.apigee_instance_disk_encryption

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_instance.vars

conditions := [
    [
        {
            "situation_description": "Apigee Instance does not have a Customer Managed Encryption Key (CMEK) configured for disk encryption",
            "remedies": [
                "Set disk_encryption_key_name with a valid KMS key",
                "Use the format: projects/{project}/locations/{location}/keyRings/{keyRing}/cryptoKeys/{cryptoKey}"
            ]
        },
        {
            "condition": "Check if disk_encryption_key_name is set",
            "attribute_path": ["disk_encryption_key_name"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details