package terraform.gcp.security.compute_engine.google_compute_disk.create_snapshot_before_destroy
import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_disk.vars
conditions := [
    [
        {
            "situation_description": "Compute disk does not create a snapshot before destroy, risking irreversible data loss on deletion.",
            "remedies": ["Set create_snapshot_before_destroy to true to ensure a recovery snapshot is taken before the disk is destroyed."]
        },
        {
            "condition": "create_snapshot_before_destroy must be true.",
            "attribute_path": ["create_snapshot_before_destroy"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details