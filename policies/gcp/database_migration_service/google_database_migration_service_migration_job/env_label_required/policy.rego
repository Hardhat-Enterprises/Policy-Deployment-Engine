package terraform.gcp.security.dms.migration_job.env_label_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dms.migration_job.vars

conditions := [
  [
    {
      "situation_description": "Migration job is missing an environment label (e.g., env = 'dev', 'prod').",
      "remedies": [
        "Add a key 'env' under labels to indicate the job's environment."
      ]
    },
    {
      "condition": "labels must contain key 'env'",
      "attribute_path": ["labels", "env"],
      "values": [null],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
