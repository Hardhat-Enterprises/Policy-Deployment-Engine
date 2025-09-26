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
      "condition": "Only approved attestor references are allowed",
      "attribute_path": ["attestor"],
      "values": [
        "projects/my-secure-project/attestors/australia-southeast1",
        "projects/my-secure-project/attestors/us-central1-attestor1",
        "projects/my-secure-project/attestors/us-central1-attestor2"
      ],
      "policy_type": "whitelist"
    }
  ]
]

# Summary message for compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Detailed compliance info for debugging
details := helpers.get_multi_summary(conditions, vars.variables).details
