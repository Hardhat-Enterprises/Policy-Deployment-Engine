package terraform.gcp.security.cloud_tpu.google_tpu_v2_vm.enable_external_ips

import future.keywords.if
import data.terraform.helpers as helpers
import data.terraform.gcp.security.cloud_tpu.google_tpu_v2_vm.vars

conditions := [
    [
        {
            "situation_description": "The Cloud TPU V2 VM has external IP addresses enabled, increasing the attack surface and exposing the TPU worker to the public internet.",
            "remedies": [
                "Set `network_config.enable_external_ips` to false and enable Private Google Access on the subnetwork instead."
            ]
        },
        {
            "condition": "Check if external IPs are disabled",
            "attribute_path": ["network_config", 0, "enable_external_ips"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details