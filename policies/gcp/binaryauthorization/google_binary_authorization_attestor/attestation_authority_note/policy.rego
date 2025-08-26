package terraform.gcp.security.binary_authorization.google_binary_authorization_attestor.attestation_authority_note

import data.terraform.gcp.helpers
import data.terraform.gcp.security.binary_authorization.google_binary_authorization_attestor.vars

conditions := [

  [
    {
      "situation_description": "Attestor is missing an attestation_authority_note",
      "remedies": [
        "Add a valid attestation_authority_note to the attestor resource"
      ]
    },
    {
      "condition": "attestation_authority_note must be present",
      "attribute_path": ["attestation_authority_note"],
      "values": [null, ""],    # considers missing or empty as violation
      "policy_type": "blacklist"
    }
  ]

]

# General summary message (pass/fail across resources)
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed summary (per resource, per condition) – good for debugging
details := helpers.get_multi_summary(conditions, vars.variables).details
