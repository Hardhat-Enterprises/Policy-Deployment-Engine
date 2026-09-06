package terraform.gcp.security.chronicle.google_chronicle_data_access_label.udm_query

import data.terraform.helpers
import data.terraform.gcp.security.chronicle.google_chronicle_data_access_label.vars

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
        "principal.hostname=\"malicious.com\""
      ],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "UDM query scopes access by an email address at a known-bad domain.",
      "remedies": ["Do not scope data access by an address at an untrusted domain."]
    },
    {
      "condition": "UDM query must not select on an email at a blacklisted domain",
      "attribute_path": ["udm_query"],
      "values": ["principal.user_email=\"*@*\"", [[], ["malicious.com"]]],
      "policy_type": "pattern blacklist"
    }
  ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

# Detailed report of each condition and situation
details := result.details
