package terraform.gcp.security.compute_engine.google_compute_per_instance_config.preserved_state_disk_delete_rule

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_per_instance_config.vars

conditions := [
    [
        {
            "situation_description": "Stateful disk is set to be permanently deleted (with its data) when the instance is removed from the group.",
            "remedies": [
                "Set preserved_state.disk.delete_rule to 'NEVER'.",
                "'NEVER' only detaches the disk on instance deletion, keeping the disk and its data recoverable; 'ON_PERMANENT_INSTANCE_DELETION' destroys the data irreversibly."
            ]
        },
        {
            "condition": "preserved_state.disk.delete_rule must not be ON_PERMANENT_INSTANCE_DELETION",
            "attribute_path": ["preserved_state", 0, "disk", 0, "delete_rule"],
            "values": ["ON_PERMANENT_INSTANCE_DELETION"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
