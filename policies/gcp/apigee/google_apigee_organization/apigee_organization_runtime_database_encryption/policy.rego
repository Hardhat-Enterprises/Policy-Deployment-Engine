
package terraform.gcp.security.apigee.google_apigee_organization.apigee_organization_runtime_database_encryption

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_organization.vars

conditions := [
    [
        {
            "situation_description": "Apigee Organization does not have a Customer Managed Encryption Key (CMEK) configured for runtime database encryption",
            "remedies": [
                "Set runtime_database_encryption_key_name with a valid KMS key",
                "Use the format: projects/{project}/locations/{location}/keyRings/{keyRing}/cryptoKeys/{cryptoKey}"
            ]
        },
        {
            "condition": "Check if runtime_database_encryption_key_name is set",
            "attribute_path": ["runtime_database_encryption_key_name"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details