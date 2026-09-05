package terraform.gcp.security.dataproc_on_gdc.google_dataproc_gdc_spark_application.properties

import data.terraform.helpers
import data.terraform.gcp.security.dataproc_on_gdc.google_dataproc_gdc_spark_application.vars

conditions := [
  [
    {
      "situation_description": "Spark application properties must not disable Spark authentication.",
      "remedies": ["Do not set spark.authenticate to false. Enable Spark authentication for the application."]
    },
    {
      "condition": "spark.authenticate must not be false",
      "attribute_path": ["properties", "spark.authenticate"],
      "values": ["false"],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
