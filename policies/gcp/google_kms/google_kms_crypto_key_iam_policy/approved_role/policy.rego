package terraform.gcp.security.google_kms.google_kms_crypto_key_iam_policy.approved_role
import data.terraform.gcp.helpers as helpers
import data.terraform.gcp.security.google_kms.google_kms_crypto_key_iam_policy.vars

conditions := [
  
  [
    {
      "situation_description": "IAM policy contains disallowed roles",
      "remedies": ["Only use approved roles like EncrypterDecrypter"]
    },
    {
      "condition": "Role must be approved",
      "attribute_path": ["policy_data", "bindings", 0, "role"],
      "values": [
        "roles/cloudkms.cryptoKeyEncrypterDecrypter"
      ],
      "policy_type": "whitelist"
    }
  ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details