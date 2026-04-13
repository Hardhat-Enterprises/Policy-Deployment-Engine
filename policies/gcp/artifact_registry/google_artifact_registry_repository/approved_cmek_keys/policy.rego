package terraform.gcp.security.artifact_registry.google_artifact_registry_repository.approved_cmek_keys

import data.terraform.helpers
import data.terraform.gcp.security.artifact_registry.google_artifact_registry_repository.vars

conditions := [
    [
        {
            "situation_description": "Artifact Registry repositories that use CMEK should reference only approved Cloud KMS keys from authorized projects, regions, key rings, and crypto keys.",
            "remedies": [
                "Set kms_key to a valid CMEK path: projects/my-project/locations/us-central1/keyRings/kr/cryptoKeys/key",
                "Use format: projects/{project}/locations/{location}/keyRings/{keyring}/cryptoKeys/{key}"
            ]
        },
        {
            "condition": "kms_key_name must follow approved CMEK key pattern",
            "attribute_path": ["kms_key_name"],
            "values": [
                "projects/*/locations/*/keyRings/*/cryptoKeys/*",
                [
                    ["project-1", "project-2"],
                    ["us-central1", "australia-southeast1"],
                    ["artifact-ring", "platform-ring"],
                    ["artifact-key", "repo-key"]
                ]
            ],
            "policy_type": "pattern whitelist"
        },
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details