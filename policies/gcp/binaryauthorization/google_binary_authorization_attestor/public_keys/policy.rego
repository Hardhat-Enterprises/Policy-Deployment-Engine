package terraform.gcp.security.binary_authorization.google_binary_authorization_attestor.public_keys

import data.terraform.gcp.helpers
import data.terraform.gcp.security.binary_authorization.google_binary_authorization_attestor.vars

conditions := [
  [
    {
      "situation_description": "Attestor has no public keys configured",
      "remedies": [
        "Add at least one valid public key in the `public_keys` block"
      ]
    },
    {
      "condition": "At least one public key must be defined",
      "attribute_path": ["public_keys"],
      "values": [null, []],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
