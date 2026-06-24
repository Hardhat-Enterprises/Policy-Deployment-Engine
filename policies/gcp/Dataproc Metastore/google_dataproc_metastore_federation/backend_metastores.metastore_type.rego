package terraform.gcp.security.dataproc_metastore.google_dataproc_metastore_federation.backend_metastores_metastore_type

import data.terraform.helpers
import data.terraform.gcp.security.dataproc_metastore.google_dataproc_metastore_federation.vars


conditions := [
  [
    {
      "situation_description": "Metastore type is not one of the approved types (DATAPROC_METASTORE or BIGQUERY).",
      "remedies": ["Set metastore_type to DATAPROC_METASTORE or BIGQUERY."]
    },
    {
      "condition": "Checks that metastore_type is in the approved list.",
      "attribute_path": ["backend_metastores", 0, "metastore_type"  ],
      "values": ["DATAPROC_METASTORE", "BIGQUERY"],
      "policy_type": "whitelist"
    }
  ]
]
   
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
