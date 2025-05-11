package terraform.gcp.security.dms.migration_job.no_physical_dump

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dms.migration_job.vars

conditions := [
  [
    {
      "situation_description": "Migration job uses 'PHYSICAL' dump_type which is less secure and may not be supported.",
      "remedies": [
        "Set dump_type to 'LOGICAL' for better compatibility and safer migration."
      ]
    },
    {
      "condition": "dump_type should not be 'PHYSICAL'",
      "attribute_path": ["dump_type"],
      "values": ["PHYSICAL"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
