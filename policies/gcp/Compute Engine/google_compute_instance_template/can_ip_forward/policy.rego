package terraform.gcp.security.compute_engine.google_compute_instance_template.can_ip_forward

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_instance_template.vars

conditions := [
    [
        {
            "situation_description": "The instance template allows IP forwarding (can_ip_forward = true), permitting packets with non-matching source or destination IPs to be sent or received",
            "remedies": ["Set can_ip_forward to false unless the instance is explicitly required to act as a NAT gateway, router, or similar forwarding device"]
        },
        {
            "condition": "can_ip_forward must not be true",
            "attribute_path": ["can_ip_forward"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details