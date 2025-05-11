package terraform.gcp.security.access_manager.service_perimeter.name

import data.terraform.gcp.helpers
import data.terraform.gcp.security.access_manager.service_perimeter.name.vars

conditions := [
  [
    {"situation_description": "Service perimeter name is too generic",
     "remedies": ["Use descriptive names indicating purpose or scope"]},
    {
      "condition": "Check if name contains the word 'test'",
      "attribute_path": ["name"],
      "values": ["test"],
      "policy_type": "pattern blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details