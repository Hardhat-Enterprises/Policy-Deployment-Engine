package terraform.gcp.security.apigee.google_apigee_organization.apigee_organization_control_plane_encryption

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_organization.vars

conditions := [
    [
        {
            "situation_description": "Apigee Organization does not have a Customer Managed Encryption Key (CMEK) configured for control plane encryption",
            "remedies": [
                "Set control_plane_encryption_key_name with a valid KMS key",
                "Use the format: projects/{project}/locations/{location}/keyRings/{keyRing}/cryptoKeys/{cryptoKey}"
            ]
        },
        {
            "condition": "Check if control_plane_encryption_key_name is set",
            "attribute_path": ["control_plane_encryption_key_name"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
