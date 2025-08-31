package terraform.gcp.security.Chronicle.data_access_label.udm_query

import data.terraform.gcp.helpers
import data.terraform.gcp.security.Chronicle.data_access_label.vars

conditions := [
  [
    {
      "situation_description": "UDM query value is not in the list of allowed values.",
      "remedies": ["Use only approved values like 'principal.hostname=\"example.com\"'."]
    },
    {
      "condition": "Only specific values are allowed in UDM query",
      "attribute_path": ["udm_query"],
      "values": [
        "principal.hostname=\"example.com\"",
        "principal.user_email=\"admin@example.com\"",
        "principal.hostname=\"google.com\""
        
      ],
      "policy_type": "whitelist"
    }
  ],
]

message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed report of each condition and situation
details := helpers.get_multi_summary(conditions, vars.variables).details
