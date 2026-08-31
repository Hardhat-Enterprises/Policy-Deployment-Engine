package terraform.gcp.security.discovery_engine.google_discovery_engine_data_connector.kms_key_name

import data.terraform.helpers
import data.terraform.gcp.security.discovery_engine.google_discovery_engine_data_connector.vars

# KMS_Key_Name

# Extract segments only from structurally valid platform-level CMEK resource IDs.
kms_key_segments := [segments |
    some resource in input.planned_values.root_module.resources
    resource.type == vars.variables.resource_type
    kms_key_name := object.get(resource.values, "kms_key_name", "")
    is_string(kms_key_name)
    matches := regex.find_all_string_submatch_n(
        `^projects/([a-z0-9-]+)/locations/([a-z0-9-]+)/keyRings/([A-Za-z0-9_-]+)/cryptoKeys/([A-Za-z0-9_-]+)$`,
        kms_key_name,
        1,
    )
    count(matches) == 1
    segments := array.slice(matches[0], 1, count(matches[0]))
]

allowed_project_ids := [segments[0] | some segments in kms_key_segments]
allowed_locations := [segments[1] | some segments in kms_key_segments]
allowed_key_rings := [segments[2] | some segments in kms_key_segments]
allowed_crypto_keys := [segments[3] | some segments in kms_key_segments]

conditions := [
    [
        {
            "situation_description": "kms_key_name is misconfigured",
            "remedies": ["Ensure it is set to a valid platform-level CMEK resource ID"],
        },
        {
            "condition": "KMS key must use the standard CMEK resource ID structure",
            "attribute_path": ["kms_key_name"],
            "values": [
                "projects/*/locations/*/keyRings/*/cryptoKeys/*",
                [
                    allowed_project_ids,
                    allowed_locations,
                    allowed_key_rings,
                    allowed_crypto_keys,
                ],
            ],
            "policy_type": "pattern whitelist",
        },
    ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
