package terraform.gcp.security.vertex_ai.google_vertex_ai_feature_online_store.encryption_spec_kms_key_name

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_feature_online_store.vars

conditions := [
    [
        {
            "situation_description": "The Feature Online Store does not use a customer-managed encryption key. The online and offline data is encrypted with a Google-managed key, so the customer cannot control or rotate the key.",
            "remedies": [
                "Set 'encryption_spec.kms_key_name' to a Cloud KMS key. Use the format 'projects/PROJECT_ID/locations/LOCATION/keyRings/KEY_RING/cryptoKeys/KEY'."
            ]
        },
        {
            "condition": "Check that a customer-managed encryption key is set",
            "attribute_path": ["encryption_spec", 0, "kms_key_name"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details