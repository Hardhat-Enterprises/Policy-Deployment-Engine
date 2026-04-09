package terraform.gcp.security.dataproc_metastore.federation.version

import data.terraform.helpers
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
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details