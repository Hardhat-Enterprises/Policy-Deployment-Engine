package terraform.gcp.security.google_kms.google_kms_crypto_key_iam_binding.role
import data.terraform.gcp.helpers as helpers
import data.terraform.gcp.security.google_kms.google_kms_crypto_key_iam_binding.vars as vars

conditions := [

  # Situation 1: Only allow specific roles (whitelist)
  [
    {
      "situation_description": "Non-standard role used",
      "remedies": ["only admin can access this"]
    },
    {
      "condition": "Role must be one of the approved roles",
      "attribute_path": ["members",0,"role"],
      "values": [
        "roles/cloudkms.cryptoKeyEncrypterDecrypter",
        "roles/cloudkms.viewer"
      ],
      "policy_type": "blacklist"
    }
  ],

  # Situation 2: Admin role must only be assigned to service accounts
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
    "values": ["*:*",[["serviceAccount"],[]]], # First slotmust match "serviceAccount" string and second slot can be anything
    "policy_type": "pattern whitelist"
  }
]

]


# Generate a summary including total resource count and non-compliant details.
summary := helpers.get_multi_summary(conditions,vars.variables)
message := summary.message