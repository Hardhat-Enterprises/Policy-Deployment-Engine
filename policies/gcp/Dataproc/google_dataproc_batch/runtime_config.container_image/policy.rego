package terraform.gcp.security.dataproc.google_dataproc_batch.runtime_config_container_image

import data.terraform.helpers
import data.terraform.gcp.security.dataproc.google_dataproc_batch.vars

conditions := [
    [
        {
            "situation_description": "Dataproc Batch runs a container image from a registry that is not approved.",
            "remedies": [
                "Publish the workload image to an approved Artifact Registry host and reference it from there."
            ]
        },
        {
            "condition": "The container image must come from an approved registry host.",
            "attribute_path": ["runtime_config", 0, "container_image"],
            "values": [
                "*/",
                [["australia-southeast1-docker.pkg.dev", "gcr.io"]]
            ],
            "policy_type": "pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
