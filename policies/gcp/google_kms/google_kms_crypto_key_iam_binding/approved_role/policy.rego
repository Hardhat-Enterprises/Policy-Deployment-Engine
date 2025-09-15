package terraform.gcp.security.google_kms.google_kms_crypto_key_iam_binding.approved_role
import data.terraform.gcp.helpers as helpers
import data.terraform.gcp.security.google_kms.google_kms_crypto_key_iam_binding.vars as vars

conditions := [

  
    [
    {
      "situation_description": "Non-standard role used",
      "remedies": ["only admin can access this"]
    },
    {
      "condition": "Role must be one of the approved roles",
      "attribute_path": ["role"],
      "values": ["roles/cloudkms.cryptoKeyEncrypterDecrypter"],
      "policy_type": "whitelist"
    }
    ],

  
    [
    {
      "situation_description": "Admin role assigned to a non-service account",
      "remedies": ["Only service accounts should be granted the admin role"]
    },
    {
      "condition": "Role is admin",
      "attribute_path": ["role"],
      "values": ["roles/cloudkms.admin"],
      "policy_type": "whitelist"
    },
    {
      "condition": "Member must be a service account",
      "attribute_path": ["members", 0],
      "values": ["*:admin-user@example.com", [["serviceAccount"]]], 
      "policy_type": "pattern whitelist"
    }
    ]

]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details