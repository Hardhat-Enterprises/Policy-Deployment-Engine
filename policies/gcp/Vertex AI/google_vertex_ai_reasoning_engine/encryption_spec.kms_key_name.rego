package terraform.gcp.security.vertex_ai.google_vertex_ai_reasoning_engine.encryption_spec_kms_key_name

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_reasoning_engine.vars

conditions := [
    [
        {
            "situation_description": "The Reasoning Engine key is not a valid customer-managed encryption key.",
            "remedies": [
                "Set 'encryption_spec.kms_key_name' to projects/{project}/locations/{location}/keyRings/{keyring}/cryptoKeys/{key}"
            ]
        },
        {
            "condition": "kms_key_name must not be empty or invalid",
            "attribute_path": ["encryption_spec", 0, "kms_key_name"],
            "values": [null, "", "invalid-kms-key"],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "The Reasoning Engine CMEK key must follow the approved key pattern.",
            "remedies": [
                "Use format: projects/{project}/locations/{location}/keyRings/{keyring}/cryptoKeys/{key}"
            ]
        },
        {
            "condition": "kms_key_name must follow approved CMEK key pattern",
            "attribute_path": ["encryption_spec", 0, "kms_key_name"],
            "values": [
                "projects/*/locations/*/keyRings/*/cryptoKeys/*",
                [
                    ["example-project", "project-1", "project-2"],
                    ["australia-southeast1", "australia-southeast2"],
                    ["example-ring", "artifact-ring", "platform-ring"],
                    ["example-key", "artifact-key", "repo-key"]
                ]
            ],
            "policy_type": "pattern whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
