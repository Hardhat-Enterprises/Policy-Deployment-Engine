package terraform.gcp.security.gdce.node_pool.disk_encryption
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gdce.node_pool.vars

conditions := [
    # 1. KMS Key presence AND format validation
    [
        {
            "situation_description": "Node pool does not have a valid KMS key assigned for encryption.",
            "remedies": ["Assign a valid KMS key in format: projects/PROJECT/locations/LOCATION/keyRings/RING/cryptoKeys/KEY"]
        },
        {
            "condition": "KMS key must be present and valid",
            "attribute_path": ["local_disk_encryption", 0, "kms_key"],
            "values": [null, "", "invalid-key-format"],  # Add specific invalid patterns
            "policy_type": "blacklist"
        }
    ],
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

summary := {
    "message": message,
    "details": details
}