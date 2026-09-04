package terraform.gcp.security.dataproc_on_gdc.google_dataproc_gdc_spark_application.pyspark_application_config_archive_uris

import data.terraform.helpers
import data.terraform.gcp.security.dataproc_on_gdc.google_dataproc_gdc_spark_application.vars

conditions := [
  [
    {
      "situation_description": "PySpark archive dependencies must not be loaded from unsafe URI schemes.",
      "remedies": ["Store archive dependencies in an approved cloud storage location such as a trusted gs:// bucket."]
    },
    {
      "condition": "Archive URIs must not use unsafe HTTP or local file sources.",
      "attribute_path": ["pyspark_application_config", 0, "archive_uris"],
      "values": ["http://", "https://", "file://"],
      "policy_type": "element blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
