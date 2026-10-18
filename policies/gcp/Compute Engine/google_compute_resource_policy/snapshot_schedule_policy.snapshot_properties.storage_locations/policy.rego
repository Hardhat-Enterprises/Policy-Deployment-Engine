package terraform.gcp.security.compute_engine.google_compute_resource_policy.snapshot_schedule_policy_snapshot_properties_storage_locations

import data.terraform.helpers as helpers
import data.terraform.gcp.security.compute_engine.google_compute_resource_policy.vars as vars


conditions := [
    [
        {
            "situation_description": "Snapshot storage location is stored outside of the approved locations.",
            "remedies": [

                "Ensure snapshot_properties.storage_locations only contains approved regions",
                "Remove any locations outside of the approved regions list to comply with data sovereignty requirements"
            ]
        },
        {
            "condition": "Check if included cloud storage locations are within approved regions",
            "attribute_path": ["snapshot_schedule_policy", 0, "snapshot_properties", 0, "storage_locations"],
            "values": ["australia-southeast1", "australia-southeast2"],
            "policy_type": "whitelist"
        }
    ]
]


result := helpers.get_multi_summary(conditions, vars.variables)  
message := result.message
details := result.details
