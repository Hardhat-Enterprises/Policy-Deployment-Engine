package terraform.gcp.security.dataproc_metastore.google_dataproc_metastore_federation.backend_metastores_name

import data.terraform.helpers
import data.terraform.gcp.security.dataproc_metastore.google_dataproc_metastore_federation.vars


conditions := [
    [
    {
      "situation_description": "Check that the relative resource name resides in the correct region",
      "remedies": ["Update region to australia-southeast1/2"]
    },
    {
      "condition": "Test version of Apache Hive metastore",
      "attribute_path": ["backend_metastores", 0, "name"],
      "values": [
        "projects/*/locations/*/services/*",
        [["acme-data-01"], ["australia-southeast1", "australia-southeast2"], ["test"]]
      ],
      "policy_type": "pattern whitelist"
    }
  ]
]

  
result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
