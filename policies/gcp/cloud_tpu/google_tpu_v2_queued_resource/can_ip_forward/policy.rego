package terraform.gcp.security.cloud_tpu.google_tpu_v2_queued_resource.can_ip_forward

import future.keywords.if
import data.terraform.helpers as helpers
import data.terraform.gcp.security.cloud_tpu.google_tpu_v2_queued_resource.vars

conditions := [
    [
        {
            "situation_description": "The Cloud TPU V2 Queued Resource has IP forwarding enabled, which can increase the network attack surface by allowing the TPU node to forward packets with non-matching source or destination IPs.",
            "remedies": [
                "Set `tpu.node_spec.node.network_config.can_ip_forward` to false unless IP forwarding is explicitly required."
            ]
        },
        {
            "condition": "Check if IP forwarding is disabled",
            "attribute_path": ["tpu", 0, "node_spec", 0, "node", 0, "network_config", 0, "can_ip_forward"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details