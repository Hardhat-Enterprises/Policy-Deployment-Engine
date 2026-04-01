package terraform.gcp.security.scc.google_scc_source_iam_binding.members

import data.terraform.helpers
import data.terraform.gcp.security.scc.google_scc_source_iam_binding.vars

conditions := [
  [
    {
      "situation_description": "Only @deakin.edu.au identities are allowed.",
      "remedies": [
        "Remove external accounts or public identities",
        "Use only organization-managed emails ending in @deakin.edu.au"
      ]
    },
    {
      "condition": "Members must belong to the approved list.",
      "attribute_path": ["members", 0],
      "values": [
        "group:secops@deakin.edu.au",
        "user:admin@deakin.edu.au",
        "user:one@deakin.edu.au",
        "user:two@deakin.edu.au"
      ],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details
