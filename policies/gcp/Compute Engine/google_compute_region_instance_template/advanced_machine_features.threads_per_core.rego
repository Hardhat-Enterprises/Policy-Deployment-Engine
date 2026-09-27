package terraform.gcp.security.compute_engine.google_compute_region_instance_template.advanced_machine_features_threads_per_core

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_instance_template.vars

conditions := [
    [
        {
            "situation_description": "Simultaneous multithreading is enabled on the regional instance template, which can increase exposure to cross-thread side-channel risks.",
            "remedies": [
                "Set advanced_machine_features.threads_per_core to 1.",
                "Use one thread per physical core to disable simultaneous multithreading.",
                "Review the instance template advanced machine features and workload requirements."
            ]
        },
        {
            "condition": "Check whether simultaneous multithreading is disabled.",
            "attribute_path": ["advanced_machine_features", 0, "threads_per_core"],
            "values": [1],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
