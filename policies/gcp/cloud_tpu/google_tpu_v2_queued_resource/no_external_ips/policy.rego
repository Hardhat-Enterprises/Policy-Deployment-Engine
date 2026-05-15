package terraform.gcp.security.cloud_tpu.google_tpu_v2_queued_resource.no_external_ips
import data.terraform.helpers
import data.terraform.gcp.security.cloud_tpu.google_tpu_v2_queued_resource.vars

conditions := [
    [
        {
            "situation_description": "The Cloud TPU V2 Queued Resource has external IP addresses enabled, increasing the attack surface and exposing the TPU worker to the public internet.",
            "remedies": [
                "Set `network_config.enable_external_ips` to false and enable Private Google Access on the subnetwork instead."
            ]
        },
        {
            "condition": "Check if external IPs are disabled",
            "attribute_path": ["tpu", 0, "node_spec", 0, "node", 0, "network_config", 0, "enable_external_ips"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details