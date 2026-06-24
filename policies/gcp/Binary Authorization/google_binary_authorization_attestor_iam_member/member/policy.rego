package terraform.gcp.security.binary_authorization.google_binary_authorization_attestor_iam.member

import data.terraform.helpers
import data.terraform.gcp.security.binary_authorization.google_binary_authorization_attestor_iam.vars

conditions := [
  [
    {
      "situation_description": "IAM member is not an approved service account for Binary Authorization",
      "remedies": [
        "Set the `member` field to an approved service account (e.g., `serviceAccount:valid-sa@my-secure-project.iam.gserviceaccount.com`)."
      ]
    },
    {
      "condition": "`member` must be set to an approved identity",
      "attribute_path": ["member"],
      "values": [
        "serviceAccount:valid-sa@my-secure-project.iam.gserviceaccount.com"
      ],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
