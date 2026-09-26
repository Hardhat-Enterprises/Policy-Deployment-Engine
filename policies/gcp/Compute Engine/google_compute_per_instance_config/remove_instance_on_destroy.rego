package terraform.gcp.security.compute_engine.google_compute_per_instance_config.remove_instance_on_destroy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_per_instance_config.vars

conditions := [
    [
        {
            "situation_description": "Deleting this config must not automatically destroy the underlying instance.",
            "remedies": [
                "Set remove_instance_on_destroy to false (or leave it unset).",
                "If the instance itself needs to be removed, do so deliberately through the instance group manager rather than as a side effect of deleting this config."
            ]
        },
        {
            "condition": "remove_instance_on_destroy must not be true",
            "attribute_path": ["remove_instance_on_destroy"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
