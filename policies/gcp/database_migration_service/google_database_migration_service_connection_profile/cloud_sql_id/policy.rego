package terraform.gcp.security.dms.connection_profile.cloud_sql_id

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dms.connection_profile.vars

conditions := [
  [
    {
      "situation_description": "PostgreSQL connection profile does not specify cloud_sql_id.",
      "remedies": [
        "Set a valid cloud_sql_id to associate with a Cloud SQL instance."
      ]
    },
    {
      "condition": "cloud_sql_id must not be empty",
      "attribute_path": ["postgresql", 0, "cloud_sql_id"],
      "values": [""],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
