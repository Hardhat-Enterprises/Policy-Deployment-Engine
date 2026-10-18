package terraform.gcp.security.compute_engine.google_compute_resource_policy.snapshot_schedule_policy_retention_policy_on_source_disk_delete

import data.terraform.helpers as helpers
import data.terraform.gcp.security.compute_engine.google_compute_resource_policy.vars as vars


conditions := [
    [
        {
            "situation_description": "Snapshot must be governed by retention rules that are defined to prevent snapshots that fall outside of the organisations data lifecycle governance.",
            "remedies": [
                "Ensure on_source_disk_delete is set to APPLY_RETENTION_POLICY",
                  ]
        },
        {
        "condition": "A retention policy must be set.",
            "attribute_path": ["snapshot_schedule_policy", 0, "retention_policy", 0, "on_source_disk_delete"],
        "values" : ["APPLY_RETENTION_POLICY"],
        "policy_type" : "whitelist"
        }
    ]
]


result := helpers.get_multi_summary(conditions, vars.variables)  
message := result.message
details := result.details
