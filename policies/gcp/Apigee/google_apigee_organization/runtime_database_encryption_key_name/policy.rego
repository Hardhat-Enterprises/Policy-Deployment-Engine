
package terraform.gcp.security.apigee.google_apigee_organization.runtime_database_encryption_key_name

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_organization.vars

conditions := [
    [
        {
            "situation_description": "Apigee Organization runtime_database_encryption_key_name is not located in an approved Australian region",
            "remedies": [
                "Set runtime_database_encryption_key_name with a valid KMS key in an approved Australian region",
                "Approved locations: australia-southeast1, australia-southeast2"
            ]
        },
        {
            "condition": "Check if runtime_database_encryption_key_name uses an approved Australian KMS location",
            "attribute_path": ["runtime_database_encryption_key_name"],
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
