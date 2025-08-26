package terraform.gcp.security.binary_authorization.google_binary_authorization_attestor_iam.role

import data.terraform.gcp.helpers
import data.terraform.gcp.security.binary_authorization.google_binary_authorization_attestor_iam.vars

conditions := [

  [
    {
      "situation_description": "IAM binding must use the correct role for attestors",
      "remedies": [
        "Set the role to `roles/containeranalysis.notes.attacher` in the google_binary_authorization_attestor_iam resource"
      ]
    },
    {
      "condition": "Role must equal roles/containeranalysis.notes.attacher",
      "attribute_path": ["role"],
      "values": ["roles/containeranalysis.notes.attacher"],   # only this role is allowed
      "policy_type": "whitelist"
    }
  ]

]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
