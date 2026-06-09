package terraform.gcp.security.cloud_tpu.google_tpu_v2_vm.service_account_scope

import future.keywords.if
import data.terraform.helpers as helpers
import data.terraform.gcp.security.cloud_tpu.google_tpu_v2_vm.vars

conditions := [
    [
        {
            "situation_description": "The Cloud TPU V2 VM service account has an empty scope list, which can allow broad access to all Cloud APIs and weaken least privilege.",
            "remedies": [
                "Configure `service_account.scope` with only the specific API scopes required by the TPU workload."
            ]
        },
        {
            "condition": "Check if service account scope is not empty",
            "attribute_path": ["service_account", 0, "scope"],
            "values": [[], null],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details