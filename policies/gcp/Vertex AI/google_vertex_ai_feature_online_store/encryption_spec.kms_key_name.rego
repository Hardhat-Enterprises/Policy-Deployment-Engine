package terraform.gcp.security.vertex_ai.google_vertex_ai_feature_online_store.encryption_spec_kms_key_name

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_feature_online_store.vars

conditions := [
    [
        {
            "situation_description": "The Feature Online Store key does not match the customer-managed encryption key path projects/*/locations/*/keyRings/*/cryptoKeys/*.",
            "remedies": [
                "Set 'encryption_spec.kms_key_name' to a Cloud KMS key in the form projects/PROJECT/locations/LOCATION/keyRings/RING/cryptoKeys/KEY."
            ]
        },
        {
            "condition": "Key must match the CMEK path shape",
            "attribute_path": ["encryption_spec", 0, "kms_key_name"],
            "values": [
                "projects/*/locations/*/keyRings/*/cryptoKeys/*",
                [["example-project"], ["australia-southeast1"], ["example-ring"], ["example-key"]]
            ],
            "policy_type": "pattern whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details