package terraform.gcp.security.compute_engine.google_compute_region_instance_template.advanced_machine_features_enable_nested_virtualization

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_instance_template.vars

conditions := [
    [
        {
            "situation_description": "Nested virtualization is enabled on the regional instance template, increasing the VM attack surface by allowing a hypervisor to run inside the guest.",
            "remedies": [
                "Set advanced_machine_features.enable_nested_virtualization to false.",
                "Enable nested virtualization only where there is an explicitly approved workload requirement.",
                "Review the instance template advanced machine features."
            ]
        },
        {
            "condition": "Check whether nested virtualization is disabled.",
            "attribute_path": ["advanced_machine_features", 0, "enable_nested_virtualization"],
            "values": [false],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
