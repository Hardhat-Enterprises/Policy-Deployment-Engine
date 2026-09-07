package terraform.gcp.security.dataproc_on_gdc.google_dataproc_gdc_spark_application.namespace

import data.terraform.helpers
import data.terraform.gcp.security.dataproc_on_gdc.google_dataproc_gdc_spark_application.vars

conditions := [
  [
    {
      "situation_description": "Spark applications must be deployed only into approved Kubernetes namespaces.",
      "remedies": ["Set namespace to an approved dedicated application namespace."]
    },
    {
      "condition": "Namespace must be in the approved namespace list.",
      "attribute_path": ["namespace"],
      "values": ["dataproc-apps"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
