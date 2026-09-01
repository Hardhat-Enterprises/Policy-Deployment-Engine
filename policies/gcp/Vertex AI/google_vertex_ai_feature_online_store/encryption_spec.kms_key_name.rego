package terraform.gcp.security.vertex_ai.google_vertex_ai_feature_online_store.encryption_spec_kms_key_name

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_feature_online_store.vars

conditions := [
    [
        {
            "situation_description": "The Feature Online Store CMEK key is in a region outside the approved Australian regions.",
            "remedies": [
                "Set 'encryption_spec.kms_key_name' to a Cloud KMS key whose location is australia-southeast1 or australia-southeast2."
            ]
        },
        {
            "condition": "CMEK key location must not be a non-approved region",
            "attribute_path": ["encryption_spec", 0, "kms_key_name"],
            "values": [
                "projects/*/locations/*/keyRings/*/cryptoKeys/*",
                [["__none__"], ["us-central1", "us-east1", "europe-west1", "global"], ["__none__"], ["__none__"]]
            ],
            "policy_type": "pattern blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
