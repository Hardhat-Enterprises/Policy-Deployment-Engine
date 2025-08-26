package terraform.gcp.security.binary_authorization.google_binary_authorization_attestor_iam.member_presence

import data.terraform.gcp.helpers
import data.terraform.gcp.security.binary_authorization.google_binary_authorization_attestor_iam.vars

conditions := [

  [
    {
      "situation_description": "IAM binding has no members defined",
      "remedies": [
        "Add at least one `member` or `members` entry to the google_binary_authorization_attestor_iam resource"
      ]
    },
    {
      "condition": "At least one IAM member must be specified",
      "attribute_path": ["member"],
      "values": [null, ""],   # disallow missing or empty single member
      "policy_type": "blacklist"
    }
  ],

  [
    {
      "situation_description": "IAM binding has no members list defined",
      "remedies": [
        "Add one or more entries to the `members` list in the google_binary_authorization_attestor_iam resource"
      ]
    },
    {
      "condition": "`members` list must not be empty",
      "attribute_path": ["members"],
      "values": [[""]],          # disallow empty list
      "policy_type": "blacklist"
    }
  ]

]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
