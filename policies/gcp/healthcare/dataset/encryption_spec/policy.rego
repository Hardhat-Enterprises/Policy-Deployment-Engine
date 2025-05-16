package terraform.gcp.security.healthcare.dataset.encryption_spec
import data.terraform.gcp.helpers
import data.terraform.gcp.security.healthcare.dataset.vars

scenarios_list := [
    [
        {
            "situation_description": "KMS key name is not in the required GCP format.",
            "remedies": ["Set 'encryption_spec.kms_key_name' to a valid KMS key, e.g., 'projects/PROJECT_ID/locations/LOCATION/keyRings/KEY_RING/cryptoKeys/KEY'."]
        },
        {
            "condition": "Malformed KMS key name",
            "attribute_path": ["encryption_spec", 0, "kms_key_name"],
            "values": ["^projects/[^/]+/locations/[^/]+/keyRings/[^/]+/cryptoKeys/[^/]+$"],
            "policy_type": "pattern whitelist"
        }
    ]
]

message := helpers.get_multi_summary(scenarios_list, vars.variables).message

details := helpers.get_multi_summary(scenarios_list, vars.variables).details