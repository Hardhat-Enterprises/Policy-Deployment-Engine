package terraform.gcp.security.gdce.node_pool.disk_encryption
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gdce.node_pool.vars

conditions := [
    # 1. KMS Key presence validation
    [
        {
            "situation_description": "Node pool does not have a KMS key assigned for encryption.",
            "remedies": ["Assign a valid KMS key to ensure control plane encryption is enabled."]
        },
        {
            "condition": "KMS key must be present",
            "attribute_path": ["local_disk_encryption", 0, "kms_key"],
            "values": [""],  # empty string or missing key is non-compliant
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