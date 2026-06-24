package terraform.gcp.security.beyondcorp.google_beyondcorp_security_gateway_iam_member.member
import data.terraform.helpers
import data.terraform.gcp.security.beyondcorp.google_beyondcorp_security_gateway_iam_member.vars
conditions := [
  [
  {
    "situation_description": "IAM Access is too broad.",
    "remedies": [
      "Change the members. It cannot be allUsers or allAuthenticatedUsers."
      ]
  },
  {
    "condition": "Public access should be prohibited.",
    "attribute_path": ["member"],
    "values": ["allUsers","allAuthenticatedUsers"],
    "policy_type": "blacklist"
  }
  ]
]


summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
