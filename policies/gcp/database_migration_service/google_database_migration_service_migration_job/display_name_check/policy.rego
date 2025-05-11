package terraform.gcp.security.dms.migration_job.display_name_check

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dms.migration_job.vars

conditions := [
  [
    {
      "situation_description": "Migration job display_name is empty or too short.",
      "remedies": [
        "Use a descriptive display_name (e.g., 'psql-prod-to-alloydb-2025')."
      ]
    },
    {
      "condition": "display_name should not be empty or too short",
      "attribute_path": ["display_name"],
      "values": ["", "a", "b", "test", "job"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
