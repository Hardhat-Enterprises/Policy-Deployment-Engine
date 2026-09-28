package terraform.gcp.security.scc.google_scc_source_iam_binding.members

import data.terraform.helpers
import data.terraform.gcp.security.scc.google_scc_source_iam_binding.vars

# policy_lint reports hard-coded-value on the address(es) below, and the finding
# stands. This attribute is a LIST, and the pattern policy types read the value as
# a single string (shared.get_target_list regex-matches it), so pointing one at an
# array makes it undefined -- which reads as "no violation", not as an error, and
# the non-compliant example would silently stop being flagged. There is no
# "element whitelist" type in policies/_helpers to check every element of a list
# against an allowed pattern; adding one is what would unblock this.
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

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details
