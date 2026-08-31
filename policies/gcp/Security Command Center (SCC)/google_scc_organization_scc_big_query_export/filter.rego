package terraform.gcp.security.scc.google_scc_organization_scc_big_query_export.filter

import data.terraform.helpers
import data.terraform.gcp.security.scc.google_scc_organization_scc_big_query_export.vars

conditions := [
  [
    {
      "situation_description": "Filter must not be empty.",
      "remedies": ["Provide a non-empty filter."]
    },
    {
      "condition": "Disallow empty or missing filter.",
      "attribute_path": ["filter"],
      "resource_value_name": "name",
      "values": [null, ""],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Filter must reference severity (HIGH/CRITICAL).",
      "remedies": ["Use one of the approved severity filters."]
    },
    {
      "condition": "Allow only approved severity filters.",
      "attribute_path": ["filter"],
      "values": [
        "severity=\"HIGH\"",
        "severity=\"CRITICAL\"",
        "severity=\"HIGH\" OR severity=\"CRITICAL\"",
        "(severity=\"HIGH\" OR severity=\"CRITICAL\")",
        "(severity=\"CRITICAL\" OR severity=\"HIGH\")"
      ],
      "policy_type": "whitelist"
    }
  ]
]


result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
