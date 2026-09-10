package terraform.gcp.security.dataproc.google_dataproc_batch.spark_batch_jar_file_uris

import data.terraform.helpers
import data.terraform.gcp.security.dataproc.google_dataproc_batch.vars

conditions := [
    [
        {
            "situation_description": "Dataproc Batch loads Spark JAR dependencies from untrusted URI schemes.",
            "remedies": [
                "Store JAR dependencies in an approved Cloud Storage location such as a trusted gs:// bucket."
            ]
        },
        {
            "condition": "JAR file URIs must not use unsafe HTTP or local file sources.",
            "attribute_path": ["spark_batch", 0, "jar_file_uris"],
            "values": ["http://", "https://", "file://"],
            "policy_type": "element blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details