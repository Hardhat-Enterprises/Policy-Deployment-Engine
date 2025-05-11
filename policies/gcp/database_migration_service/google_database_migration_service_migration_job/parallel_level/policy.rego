package terraform.gcp.security.dms.migration_job.parallel_level

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dms.migration_job.vars

conditions := [
  [
    {
      "situation_description": "Migration job uses a non-optimal dump_parallel_level.",
      "remedies": [
        "Set performance_config.dump_parallel_level to 'OPTIMAL' or 'MAX' for faster migration performance."
      ]
    },
    {
      "condition": "Allowed values are 'OPTIMAL' or 'MAX'",
      "attribute_path": ["performance_config", 0, "dump_parallel_level"],
      "values": ["OPTIMAL", "MAX"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
