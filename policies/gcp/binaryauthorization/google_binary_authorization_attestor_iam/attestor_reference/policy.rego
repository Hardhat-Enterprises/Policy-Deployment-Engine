package terraform.gcp.security.binary_authorization.google_binary_authorization_attestor_iam.attestor_reference

import data.terraform.gcp.helpers
import data.terraform.gcp.security.binary_authorization.google_binary_authorization_attestor_iam.vars

conditions := [
  [
    {
      "situation_description": "IAM binding attestor reference missing or malformed",
      "remedies": [
        "Set `attestor` to a valid attestor path: projects/<project-id>/attestors/<attestor-id>"
      ]
    },
    {
      "condition": "attestor must follow the attestor resource pattern",
      "attribute_path": ["attestor"],
      "values": ["projects/*/attestors/*"],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
