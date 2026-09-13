package terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.encryption_spec_cloud_kms_key

import data.terraform.helpers
import data.terraform.gcp.security.certificate_authority_service.google_privateca_ca_pool.vars

conditions := [
    [
        {
            "situation_description": "CA Pools must use a customer-managed Cloud KMS key for encryption.",
            "remedies": [
                "Set encryption_spec.cloud_kms_key to an existing Cloud KMS key."
            ]
        },
        {
            "condition": "Cloud KMS key must be configured",
            "attribute_path": ["encryption_spec", 0, "cloud_kms_key"],
            "values": [null, ""],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details