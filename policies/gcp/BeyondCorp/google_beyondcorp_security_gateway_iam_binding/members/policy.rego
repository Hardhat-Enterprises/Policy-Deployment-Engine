package terraform.gcp.security.beyondcorp.google_beyondcorp_security_gateway_iam_binding.members
import data.terraform.helpers
import data.terraform.gcp.security.beyondcorp.google_beyondcorp_security_gateway_iam_binding.vars
conditions := [
  [
  {
    "situation_description": "IAM binding contains public users.",
    "remedies": [
      "Remove allUsers/allAuthenticatedUsers."
      ]
  },
  {
    "condition": "Disallow public users",
    "attribute_path": ["members"],
    "values": ["allUsers","allAuthenticatedUsers"],
    "policy_type": "blacklist"
  }
  ]
]


summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details
