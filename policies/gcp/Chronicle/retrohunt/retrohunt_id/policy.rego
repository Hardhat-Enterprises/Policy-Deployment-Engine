package terraform.gcp.security.Chronicle.retrohunt.retrohunt_id

import data.terraform.gcp.helpers
import data.terraform.gcp.security.Chronicle.retrohunt.vars

conditions := [
  [
    {
      "situation_description": "Retrohunt ID does not match the expected UUID format.",
      "remedies": [
        "Ensure the 'retrohunt' field matches the UUID format: 'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'."
      ]
    },
    {
      "condition": "Retrohunt ID must match UUID format",
      "attribute_path": ["retrohunt"],
      "values": ["^[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}$"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
