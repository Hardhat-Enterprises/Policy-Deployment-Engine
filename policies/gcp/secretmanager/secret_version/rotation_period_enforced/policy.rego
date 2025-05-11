package terraform.gcp.security.secretmanager.secret.rotation_period_enforced
import data.terraform.gcp.helpers
import data.terraform.gcp.security.secretmanager.secret.vars

conditions := [
  [
    {
      "situation_description": "Secret is missing rotation configuration",
      "remedies": ["Define next_rotation_time and rotation_period to enforce automated secret rotation"]
    },
    {
      "condition": "Check if rotation is missing or incomplete",
      "attribute_path": ["rotation"],
      "values": [null],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
