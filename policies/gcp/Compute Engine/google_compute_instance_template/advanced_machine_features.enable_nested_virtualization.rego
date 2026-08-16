package terraform.gcp.security.compute_engine.google_compute_instance_template.advanced_machine_features_enable_nested_virtualization

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_instance_template.vars

conditions := [
    [
        {
            "situation_description": "The instance template has nested virtualization enabled (advanced_machine_features.enable_nested_virtualization is true), expanding the attack surface and potentially undermining hypervisor isolation guarantees",
            "remedies": ["Set advanced_machine_features.enable_nested_virtualization to false unless nested virtualization is explicitly required"]
        },
        {
            "condition": "advanced_machine_features.enable_nested_virtualization must be false",
            "attribute_path": ["advanced_machine_features", 0, "enable_nested_virtualization"],
            "values": [false],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details