package terraform.gcp.security.cloud_tpu.google_tpu_v2_vm.email

import future.keywords.if
import data.terraform.helpers as helpers
import data.terraform.gcp.security.cloud_tpu.google_tpu_v2_vm.vars

conditions := [
    [
        {
            "situation_description": "No dedicated service account is configured for the Cloud TPU V2 VM. Using the default compute service account violates the principle of least privilege.",
            "remedies": [
                "Set `service_account.email` to a dedicated service account with only the required IAM permissions."
            ]
        },
        {
            "condition": "Check if a dedicated service account email is configured",
            "attribute_path": ["service_account", 0, "email"],
            "values": ["", null],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details