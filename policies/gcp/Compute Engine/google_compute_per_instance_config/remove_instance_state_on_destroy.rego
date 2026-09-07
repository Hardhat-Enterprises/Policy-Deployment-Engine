package terraform.gcp.security.compute_engine.google_compute_per_instance_config.remove_instance_state_on_destroy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_per_instance_config.vars

conditions := [
    [
        {
            "situation_description": "Deleting this config leaves preserved disks/external-IPs/metadata bound to the instance for an unpredictable, unscheduled period instead of removing them immediately.",
            "remedies": [
                "Set remove_instance_state_on_destroy to true.",
                "Immediate removal makes state cleanup deterministic instead of deferring it to some future, unscheduled instance recreation or update."
            ]
        },
        {
            "condition": "remove_instance_state_on_destroy must be true",
            "attribute_path": ["remove_instance_state_on_destroy"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
