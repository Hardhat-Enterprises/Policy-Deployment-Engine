package terraform.gcp.security.chronicle.data_access_label.udm_query

import data.terraform.gcp.helpers
import data.terraform.gcp.security.chronicle.data_access_label.vars

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
        "principal.hostname=\"malicious.com\"",
        "principal.user_email=\"admin@malicious.com\"",
        "principal.hostname=\"malicious.com\""
        
      ],
      "policy_type": "blacklist"
    }
  ],
]

message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed report of each condition and situation
details := helpers.get_multi_summary(conditions, vars.variables).details
