package terraform.gcp.security.assured_workloads.google_assured_workloads_workload.kms_settings
import data.terraform.helpers
import data.terraform.gcp.security.assured_workloads.google_assured_workloads_workload.vars

# Policy: kms_settings
# Description: Ensures KMS key rotation period is set to 90 days or less.
# Regular key rotation reduces the risk of key compromise.
# Resource: google_assured_workloads_workload

conditions := [
    [
    {"situation_description": "KMS key rotation period exceeds 90 days",
    "remedies": [
        "Set kms_settings.rotation_period to 7776000 (90 days) or less to ensure regular key rotation"
    ]},
    {
        "condition": "Check KMS rotation period is 90 days or less",
        "attribute_path": ["kms_settings", 0, "rotation_period"],
        "values": [7776001],
        "policy_type": "blacklist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details