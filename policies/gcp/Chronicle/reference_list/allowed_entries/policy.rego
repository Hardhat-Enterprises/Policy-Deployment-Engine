package terraform.gcp.security.Chronicle.reference_list.allowed_entries

import data.terraform.gcp.helpers
import data.terraform.gcp.security.Chronicle.reference_list.vars

conditions := [
  [
    {
      "situation_description": "The reference list needs entry",
      "remedies": [
        "Ensure that every entry in the reference list has a non-empty value.",
        "Remove or replace empty entries with valid values."
      ]
    },
    {
      "condition": "Reference list entries contain empty or null 'value'",
      "attribute_path": ["entries", 0 , "value"],
      "values": ["", null],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
