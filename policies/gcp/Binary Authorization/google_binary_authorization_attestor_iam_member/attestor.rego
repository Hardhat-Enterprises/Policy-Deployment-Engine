package terraform.gcp.security.binary_authorization.google_binary_authorization_attestor_iam_member.attestor

import data.terraform.helpers
import data.terraform.gcp.security.binary_authorization.google_binary_authorization_attestor_iam_member.vars

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
        "projects/*/attestors/*",
        [
          ["my-secure-project"],
          ["australia-southeast1", "us-central1-attestor1", "us-central1-attestor2"]
        ]
      ],
      "policy_type": "pattern whitelist"
    }
  ]
]

# Summary message for compliance
result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

# Detailed compliance info for debugging
details := result.details
