package terraform.gcp.security.binary_authorization.google_binary_authorization_attestor.note_reference

import data.terraform.gcp.helpers
import data.terraform.gcp.security.binary_authorization.google_binary_authorization_attestor.vars

conditions := [
  [
    {
      "situation_description": "Attestor note_reference is missing or malformed",
      "remedies": [
        "Ensure `note_reference` follows the format `projects/<project-id>/notes/<note-id>`"
      ]
    },
    {
      "condition": "note_reference must follow GCP format",
      "attribute_path": ["attestation_authority_note", 0, "note_reference"],
      "regex": "^projects/[a-z0-9-]+/notes/[a-zA-Z0-9_-]+$",
      "policy_type": "regex"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
