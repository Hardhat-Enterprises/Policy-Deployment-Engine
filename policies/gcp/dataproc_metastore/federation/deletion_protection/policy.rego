package terraform.gcp.security.dataproc_metastore.federation.deletion_protection

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataproc_metastore.federation.vars

conditions := [
  [
    {
      "situation_description": "Check that the federation Hive metastore version is supported.",
      "remedies": ["Update version to one of the supported values."]
    },
    {
      "condition": "Test version of Apache Hive metastore",
      "attribute_path": ["version"],
      "values": ["3.1.2", "2.3.6", "2.2.0", "1.2.2"],
      "policy_type": "whitelist"
    }
  ],
  [
    {
      "situation_description": "Deletion protection is enabled, which may block necessary cleanup operations.",
      "remedies": ["Set deletion_protection to false to allow resources to be deleted when required."]
    },
    {
      "condition": "Checks that deletion_protection is disabled.",
      "attribute_path": ["deletion_protection"],
      "values": [false],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Metastore type is not one of the approved types (DATAPROC_METASTORE or BIGQUERY).",
      "remedies": ["Set metastore_type to DATAPROC_METASTORE or BIGQUERY."]
    },
    {
      "condition": "Checks that metastore_type is in the approved list.",
      "attribute_path": ["backend_metastore", 0, "metastore_type"  ],
      "values": ["DATAPROC_METASTORE", "BIGQUERY"],
      "policy_type": "whitelist"
    }
  ],
    [
    {
      "situation_description": "Check that the relative resource name resides in the correct region",
      "remedies": ["Update reigion to australia-southeast1/2"]
    },
    {
      "condition": "Test version of Apache Hive metastore",
      "attribute_path": ["backend_metastores", "name"],
      "values": ["projects/acme-data-01/locations/*/services/hive-prod", [["australia-southeast2", "australia-southeast1"]]],
      "policy_type": "patter_whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details