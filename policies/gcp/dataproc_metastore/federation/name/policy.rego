package terraform.gcp.security.dataproc_metastore.federation.name

import data.terraform.helpers
import data.terraform.gcp.security.dataproc_metastore.federation.vars


conditions := [
    [
    {
      "situation_description": "Check that the relative resource name resides in the correct region",
      "remedies": ["Update region to australia-southeast1/2"]
    },
    {
      "condition": "Test version of Apache Hive metastore",
      "attribute_path": ["backend_metastores", 0, "name"],
      "values": ["projects/acme-data-01/locations/australia-southeast1/services/test", "projects/acme-data-01/locations/australia-southeast2/services/test"],
      "policy_type": "whitelist"
    }
  ]
]

  
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details