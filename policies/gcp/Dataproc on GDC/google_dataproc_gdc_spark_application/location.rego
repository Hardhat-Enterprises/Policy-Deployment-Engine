package terraform.gcp.security.dataproc_on_gdc.google_dataproc_gdc_spark_application.location

import data.terraform.helpers
import data.terraform.gcp.security.dataproc_on_gdc.google_dataproc_gdc_spark_application.vars

conditions := [
  [
    {
      "situation_description": "Spark application location must reside in an approved Australian region.",
      "remedies": ["Set location to australia-southeast1 or australia-southeast2."]
    },
    {
      "condition": "Location must be in the approved Australian region list.",
      "attribute_path": ["location"],
      "values": ["australia-southeast1", "australia-southeast2"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
