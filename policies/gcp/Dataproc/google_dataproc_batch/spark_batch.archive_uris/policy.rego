package terraform.gcp.security.dataproc.google_dataproc_batch.spark_batch_archive_uris

import data.terraform.helpers
import data.terraform.gcp.security.dataproc.google_dataproc_batch.vars

conditions := [
    [
        {
            "situation_description": "Dataproc Batch loads Spark archive dependencies from untrusted URI schemes.",
            "remedies": [
                "Store archive dependencies in an approved Cloud Storage location such as a trusted gs:// bucket."
            ]
        },
        {
            "condition": "Archive URIs must not use unsafe HTTP or local file sources.",
            "attribute_path": ["spark_batch", 0, "archive_uris"],
            "values": ["http://", "https://", "file://"],
            "policy_type": "element blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
