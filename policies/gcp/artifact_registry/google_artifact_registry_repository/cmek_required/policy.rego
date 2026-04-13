package terraform.gcp.security.artifact_registry.google_artifact_registry_repository.cmek_required

import data.terraform.helpers
import data.terraform.gcp.security.artifact_registry.google_artifact_registry_repository.vars

conditions := [
    [
        {
            "situation_description": "Artifact Registry repositories should use a customer-managed encryption key (CMEK) to strengthen control over encryption and key management.",
            "remedies": [
                "Set kms_key_name to a valid Cloud KMS key resource.",
                "Use an approved KMS key from the correct project and region."
            ]
        },
        {
            "condition": "kms_key_name must be configured",
            "attribute_path": ["kms_key_name"],
            "values": [null, "", "kms-key"],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details