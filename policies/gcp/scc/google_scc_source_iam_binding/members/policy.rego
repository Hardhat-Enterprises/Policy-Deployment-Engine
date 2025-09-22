package terraform.gcp.security.scc.google_scc_source_iam_binding.members

import data.terraform.gcp.helpers
import data.terraform.gcp.security.scc.google_scc_source_iam_binding.vars

conditions := [
  [
    {
      "situation_description": "Only @deakin.edu.au identities are allowed in IAM bindings.",
      "remedies": [
        "Remove external or public accounts",
        "Use only organization-managed emails ending in @deakin.edu.au"
      ]
    },
    {
      "condition": "Check that members belong to the approved allowlist",
      "attribute_path": ["members"],
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

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
