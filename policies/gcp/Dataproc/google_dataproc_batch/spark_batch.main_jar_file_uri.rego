package terraform.gcp.security.dataproc.google_dataproc_batch.spark_batch_main_jar_file_uri

import data.terraform.helpers
import data.terraform.gcp.security.dataproc.google_dataproc_batch.vars

conditions := [
    [
        {
            "situation_description": "Dataproc Batch executes its main Spark JAR from an untrusted storage location.",
            "remedies": [
                "Store the main application JAR in an approved Cloud Storage location such as a trusted gs:// bucket."
            ]
        },
        {
            "condition": "The main JAR URI must be held in approved cloud storage.",
            "attribute_path": ["spark_batch", 0, "main_jar_file_uri"],
            "values": [
                "*://",
                [["gs"]]
            ],
            "policy_type": "pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
