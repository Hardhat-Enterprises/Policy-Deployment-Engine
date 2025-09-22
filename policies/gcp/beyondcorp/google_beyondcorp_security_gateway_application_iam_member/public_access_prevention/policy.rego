package terraform.gcp.security.beyondcorp.google_beyondcorp_security_gateway_application_iam_member.public_access_prevention
import data.terraform.gcp.helpers
import data.terraform.gcp.security.beyondcorp.google_beyondcorp_security_gateway_application_iam_member.vars
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
message := summary.message
details := summary.details