package terraform.gcp.security.biglake.google_biglake_database.enforce_type_hive 

import data.terraform.helpers
import data.terraform.gcp.security.biglake.google_biglake_database.vars

conditions := [
  [
    {
      "situation_description": "BigLake Database type is not HIVE",
      "remedies": [
        "Set type = \"HIVE\" for the google_biglake_database resource"
      ]
    },
    {
      "condition": "Only allow HIVE database type",
      "attribute_path": ["type"],
      "values": ["HIVE"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
