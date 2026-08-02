package terraform.gcp.security.compute_engine.google_compute_region_instant_snapshot.source_disk

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_instant_snapshot.vars

conditions := [
    [
    {"situation_description" : "source_disk references a disk in an untrusted project",
    "remedies":[ "Only create instant snapshots from disks in approved/trusted projects"]},
    {
        "condition": "Test if source_disk points to the untrusted-project disk",
        "attribute_path" : ["source_disk"],
        "values" : ["projects/untrusted-project/regions/us-central1/disks/untrusted-disk"],
        "policy_type" : "blacklist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
