package terraform.gcp.security.binary_authorization.google_binary_authorization_attestor.public_keys

import data.terraform.gcp.helpers
import data.terraform.gcp.security.binary_authorization.google_binary_authorization_attestor.vars

conditions := [

  [
    {
      "situation_description": "`public_keys` attribute is defined but empty",
      "remedies": [
        "Add at least one valid public key to the google_binary_authorization_attestor resource"
      ]
    },
    {
      "condition": "`public_keys` must not be empty when defined",
      "attribute_path": ["public_keys"],
      "values": [["test-key"]],    # disallow empty list
      "policy_type": "blacklist"
    }
  ]

]

# General summary (for CI/CD or dashboards)
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed compliance breakdown per resource
details := helpers.get_multi_summary(conditions, vars.variables).details
