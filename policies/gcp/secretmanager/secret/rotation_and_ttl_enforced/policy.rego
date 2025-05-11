package terraform.gcp.security.secretmanager.secret.rotation_and_ttl_enforced
import data.terraform.gcp.helpers
import data.terraform.gcp.security.secretmanager.secret.vars

conditions := [
  [
    {
      "situation_description": "Secret is missing both rotation configuration and TTL",
      "remedies": [
        "Specify both rotation (next_rotation_time & rotation_period) and TTL to ensure lifecycle control"
      ]
    },
    {
      "condition": "Missing both rotation and ttl",
      "attribute_path": [],
      "values": [["rotation"], ["ttl"]],
      "policy_type": "multi_field_presence"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
