package terraform.gcp.security.cloud_tpu.google_tpu_v2_vm.enable_external_ips_network_configs

import future.keywords.if
import data.terraform.helpers as helpers
import data.terraform.gcp.security.cloud_tpu.google_tpu_v2_vm.vars

conditions := [
    [
        {
            "situation_description": "The Cloud TPU V2 VM has external IP addresses enabled through repeated network_configs, increasing the attack surface and exposing the TPU workers to the public internet.",
            "remedies": [
                "Set `network_configs.enable_external_ips` to false and use internal IPs with Private Google Access enabled on the selected network or subnetwork."
            ]
        },
        {
            "condition": "Check if external IPs are disabled in repeated network_configs",
            "attribute_path": ["network_configs", 0, "enable_external_ips"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details