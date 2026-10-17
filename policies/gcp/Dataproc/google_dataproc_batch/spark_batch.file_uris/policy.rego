package terraform.gcp.security.dataproc.google_dataproc_batch.spark_batch_file_uris

import data.terraform.helpers
import data.terraform.gcp.security.dataproc.google_dataproc_batch.vars

conditions := [
    [
        {
            "situation_description": "Dataproc Batch loads Spark workload files from untrusted URI schemes.",
            "remedies": [
                "Store workload files in an approved Cloud Storage location such as a trusted gs:// bucket."
            ]
        },
        {
            "condition": "File URIs must not use unsafe HTTP or local file sources.",
            "attribute_path": ["spark_batch", 0, "file_uris"],
            "values": ["http://", "https://", "file://"],
            "policy_type": "element blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
