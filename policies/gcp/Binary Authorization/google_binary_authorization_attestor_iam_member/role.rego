package terraform.gcp.security.binary_authorization.google_binary_authorization_attestor_iam_member.role

import data.terraform.helpers
import data.terraform.gcp.security.binary_authorization.google_binary_authorization_attestor_iam_member.vars


conditions := [
  [
    {
      "situation_description": "IAM binding is not using the required attestor role",
      "remedies": [
        "Set the `role` field to `roles/containeranalysis.notes.attacher` to allow proper note signing in Binary Authorization"
      ]
    },
    {
      "condition": "`role` must be set to `roles/containeranalysis.notes.attacher`",
      "attribute_path": ["role"],
      "values": ["roles/containeranalysis.notes.attacher"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
