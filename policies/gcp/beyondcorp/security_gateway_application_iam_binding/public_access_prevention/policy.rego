package terraform.gcp.security.beyondcorp.security_gateway_application_iam_binding.public_access_prevention
import data.terraform.gcp.helpers
import data.terraform.gcp.security.beyondcorp.security_gateway_application_iam_binding.public_access_prevention.vars
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
