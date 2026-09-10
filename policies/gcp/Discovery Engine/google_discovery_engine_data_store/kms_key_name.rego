package terraform.gcp.security.discovery_engine.google_discovery_engine_data_store.kms_key_name

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_data_store.vars

conditions := [
    [
        {
            "situation_description": "Data store is not configured with a CMEK encryption key",
            "remedies": [
                "Set kms_key_name to a valid KMS key path: projects/{project}/locations/{location}/keyRings/{keyRing}/cryptoKeys/{key}"
            ]
        },
        {
            "condition": "kms_key_name must not be empty or null",
            "attribute_path": ["kms_key_name"],
            "values": [null, ""],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
