package terraform.gcp.security.compute.instance.desired_status

import data.terraform.gcp.helpers
import data.terraform.gcp.security.compute.instance.vars

conditions := [
  [
    {
      "situation_description": "Instance is configured with an invalid desired_status (TERMINATED or SUSPENDED)",
      "remedies": [
        "Set 'desired_status = \"RUNNING\"' to ensure the instance starts automatically after creation"
      ]
    },
    {
      "condition": "desired_status must not be TERMINATED or SUSPENDED",
      "attribute_path": ["desired_status"],
      "values": ["TERMINATED", "SUSPENDED"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
