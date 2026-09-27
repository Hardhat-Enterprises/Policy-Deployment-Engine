package terraform.gcp.security.compute_engine.google_compute_region_instance_template.can_ip_forward

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_instance_template.vars

conditions := [
    [
        {
            "situation_description": "IP forwarding is enabled on the regional instance template, allowing packets with non-matching source or destination IP addresses and potentially enabling routing or packet-forwarding behaviour.",
            "remedies": [
                "Set can_ip_forward to false.",
                "Enable IP forwarding only where there is an explicitly approved networking requirement.",
                "Review the instance template networking configuration."
            ]
        },
        {
            "condition": "Check whether can_ip_forward is disabled.",
            "attribute_path": ["can_ip_forward"],
            "values": [false],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
