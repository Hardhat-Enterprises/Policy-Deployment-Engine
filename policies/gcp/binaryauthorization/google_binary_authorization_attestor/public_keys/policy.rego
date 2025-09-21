package terraform.gcp.security.binary_authorization.google_binary_authorization_attestor.public_keys

import data.terraform.gcp.helpers
import data.terraform.gcp.security.binary_authorization.google_binary_authorization_attestor.vars

conditions := [
  [
    {
      "situation_description": "Attestor has no public keys configured",
      "remedies": [
        "Define at least one valid public key under the `public_keys` block in `attestation_authority_note`"
      ]
    },
    {
      "condition": "`public_keys` list must contain at least one entry",
      "attribute_path": ["attestation_authority_note", 0, "public_keys"],
      "values": [null, []],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
