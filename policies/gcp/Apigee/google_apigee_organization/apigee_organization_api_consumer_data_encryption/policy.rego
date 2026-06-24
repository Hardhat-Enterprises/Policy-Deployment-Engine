package terraform.gcp.security.apigee.google_apigee_organization.apigee_organization_api_consumer_data_encryption

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_organization.vars

conditions := [
    [
        {
            "situation_description": "Apigee Organization api_consumer_data_encryption_key_name is not set",
            "remedies": [
                "Set api_consumer_data_encryption_key_name with a valid KMS key",
                "Use the format: projects/{project}/locations/{location}/keyRings/{keyRing}/cryptoKeys/{cryptoKey}"
            ]
        },
        {
            "condition": "Check if api_consumer_data_encryption_key_name is not null",
            "attribute_path": ["api_consumer_data_encryption_key_name"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "Apigee Organization api_consumer_data_encryption_key_name is not located in an approved Australian region",
            "remedies": [
                "Set api_consumer_data_encryption_key_name with a valid KMS key in an approved Australian region",
                "Approved locations: australia-southeast1, australia-southeast2"
            ]
        },
        {
            "condition": "Check if api_consumer_data_encryption_key_name uses an approved Australian KMS location",
            "attribute_path": ["api_consumer_data_encryption_key_name"],
            "values": [
                "projects/*/locations/*/keyRings/*/cryptoKeys/*",
                [[], ["us-central1", "us-east1", "europe-west1", "asia-east1"], [], []]
            ],
            "policy_type": "pattern blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details