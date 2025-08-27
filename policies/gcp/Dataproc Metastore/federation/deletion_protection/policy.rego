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
  ]
]

# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.message"
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
# Useful for debugging
# Use 'opa eval ... "data.terraform.gcp.security.<service>.<resource_type>.<policy_name>.details"
details := helpers.get_multi_summary(conditions, vars.variables).details