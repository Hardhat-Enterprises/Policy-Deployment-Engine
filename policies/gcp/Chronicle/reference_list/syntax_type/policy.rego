package terraform.gcp.security.Chronicle.reference_list.syntax_type

import data.terraform.gcp.helpers
import data.terraform.gcp.security.Chronicle.reference_list.vars

conditions := [
  [
    {
      "situation_description": "Reference list uses a disallowed syntax_type.",
      "remedies": [
        "Use only 'REFERENCE_LIST_SYNTAX_TYPE_PLAIN_TEXT_STRING' or 'REFERENCE_LIST_SYNTAX_TYPE_CIDR' as syntax_type."
      ]
    },
    {
      "condition": "Check if syntax_type is not in the allowed list",
      "attribute_path": ["syntax_type"],
      "values": [
        "REFERENCE_LIST_SYNTAX_TYPE_PLAIN_TEXT_STRING",
        "REFERENCE_LIST_SYNTAX_TYPE_CIDR"
      ],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
