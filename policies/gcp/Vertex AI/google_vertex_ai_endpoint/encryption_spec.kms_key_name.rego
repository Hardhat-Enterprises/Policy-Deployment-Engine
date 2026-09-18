package terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.encryption_spec_kms_key_name

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint.vars

conditions := [
    [
        {
            "situation_description": "Ensure the endpoint explicitly declares an encryption_spec KMS key.",
            "remedies": ["Provide a `kms_key_name`."]
        },
        {
            "condition": "kms_key_name is missing or empty",
            "attribute_path": ["encryption_spec", 0, "kms_key_name"],
            "values": [null, ""],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details