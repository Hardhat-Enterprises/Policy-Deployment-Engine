package terraform.gcp.security.apigee.google_apigee_instance.apigee_instance_disk_encryption

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_instance.vars

conditions := [
    [
        {
            "situation_description": "Apigee Instance disk_encryption_key_name does not follow the required KMS key format or is not located in an approved Australian region",
            "remedies": [
                "Set disk_encryption_key_name with a valid KMS key in an approved Australian region",
                "Use the format: projects/{project}/locations/{location}/keyRings/{keyRing}/cryptoKeys/{cryptoKey}",
                "Approved locations: australia-southeast1, australia-southeast2"
            ]
        },
        {
            "condition": "Check if disk_encryption_key_name uses an approved Australian KMS location",
            "attribute_path": ["disk_encryption_key_name"],
            "values": [
                "projects/.+/locations/*/keyRings/.+/cryptoKeys/.+",
                [["australia-southeast1", "australia-southeast2"]]
            ],
            "policy_type": "pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details