package terraform.gcp.security.dms.migration_job.continuous_type_enforced

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dms.migration_job.vars

conditions := [
  [
    {
      "situation_description": "Migration job is not of type 'CONTINUOUS'.",
      "remedies": [
        "Set the type attribute to 'CONTINUOUS' to enable continuous replication."
      ]
    },
    {
      "condition": "type must be 'CONTINUOUS'",
      "attribute_path": ["type"],
      "values": ["CONTINUOUS"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
