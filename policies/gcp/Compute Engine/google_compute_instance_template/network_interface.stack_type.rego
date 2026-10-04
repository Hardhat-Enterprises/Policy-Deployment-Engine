package terraform.gcp.security.compute_engine.google_compute_instance_template.network_interface_stack_type

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_instance_template.vars

conditions := [
    [
        {
            "situation_description": "The instance template's network_interface.stack_type is not set to IPV4_ONLY, unnecessarily widening the network exposure surface by enabling IPv6",
            "remedies": ["Set network_interface.stack_type to 'IPV4_ONLY' unless IPv6 connectivity is explicitly required"]
        },
        {
            "condition": "network_interface.stack_type must be IPV4_ONLY",
            "attribute_path": ["network_interface", 0, "stack_type"],
            "values": ["IPV4_ONLY"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details