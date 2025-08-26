package terraform.gcp.security.binary_authorization.google_binary_authorization_attestor.name

import data.terraform.gcp.helpers
import data.terraform.gcp.security.binary_authorization.google_binary_authorization_attestor.vars

conditions := [

  [
    {
      "situation_description": "Attestor is missing a name",
      "remedies": [
        "Set a non-empty name for the google_binary_authorization_attestor resource"
      ]
    },
    {
      "condition": "Attestor name must not be empty",
      "attribute_path": ["name"],
      "values": ["test-attestor"],          # disallow empty string
      "policy_type": "blacklist"
    }
  ]

]

# General summary message (useful in CI/CD reports)
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed per-resource breakdown (useful for debugging in VS Code / CLI)
details := helpers.get_multi_summary(conditions, vars.variables).details
