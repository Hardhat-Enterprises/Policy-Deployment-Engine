package terraform.gcp.security.artifact_registry.repository_iam.block_public_access

import data.terraform.gcp.helpers
import data.terraform.gcp.security.artifact_registry.repository_iam.vars

conditions := [
  [
    {
      "situation_description": "IAM member is publicly accessible (e.g., allUsers or allAuthenticatedUsers), which exposes the repository to the internet.",
      "remedies": [
        "Avoid assigning roles to public IAM members like allUsers or allAuthenticatedUsers.",
        "Assign roles only to trusted identities such as specific service accounts, users, or groups."
      ]
    },
    {
      "condition": "Only allow approved IAM members and block public access.",
      "attribute_path": ["member"],
      "values": [
        "user:admin@example.com",
        "serviceAccount:secure-deployer@example-project.iam.gserviceaccount.com",
        "group:dev-team@example.com"
      ],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
