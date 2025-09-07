package terraform.gcp.security.binary_authorization.google_binary_authorization_attestor_iam.attestor_reference

import data.terraform.gcp.helpers
import data.terraform.gcp.security.binary_authorization.google_binary_authorization_attestor_iam.vars

conditions := [
  [
    {
      "situation_description": "IAM binding has an invalid attestor reference format",
      "remedies": [
        "Ensure `attestor` follows the format `projects/<project-id>/attestors/<attestor-id>`"
      ]
    },
    {
      "condition": "Attestor must follow the required GCP format",
      "attribute_path": ["attestor"],
      "regex": "^projects/[a-z0-9-]+/attestors/[a-zA-Z0-9_-]+$",
      "policy_type": "regex"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
