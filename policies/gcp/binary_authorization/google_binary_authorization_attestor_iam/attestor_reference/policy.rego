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
        "projects/australia-southeast1/attestors/attestor1",
        "projects/australia-southeast1/attestors/attestor2",
        "projects/us-central1/attestors/attestor1",
        "projects/us-central1/attestors/attestor2",
        "projects/europe-west1/attestors/attestor1",
        "projects/europe-west1/attestors/attestor2"
      ],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
