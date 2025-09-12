package terraform.gcp.security.chronicle.reference_list.enforce_reference_list_id_rules

import data.terraform.gcp.helpers
import data.terraform.gcp.security.chronicle.reference_list.vars

conditions := [
  [
    {
      "situation_description": "The reference_list_id must follow naming rules",
      "remedies": [
        "Ensure reference_list_id starts with a letter.",
        "Use only letters, numbers, and underscores and don't write only a single digit number and _"
      ]
    },
    {
      "condition": "Reference list ID has invalid prefix or format",
      "attribute_path": ["reference_list_id"],
      "values": ["_", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
