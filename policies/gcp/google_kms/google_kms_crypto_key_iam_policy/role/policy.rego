package terraform.gcp.security.google_kms.google_kms_crypto_key_iam_policy.role
import data.terraform.gcp.helpers as helpers
import data.terraform.gcp.security.google_kms.google_kms_crypto_key_iam_policy.vars as vars
import future.keywords

conditions := [

  # Situation 1: Role must be from an approved set
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
  ],

  # Situation 2: Forbid overly permissive member types
  [
    {
      "situation_description": "Policy includes forbidden member types like 'allUsers'",
      "remedies": ["Do not use wildcard members such as allUsers or allAuthenticatedUsers"]
    },
    {
      "condition": "Forbidden members",
      "attribute_path": ["policy_data", "bindings", 0, "members", 0],
      "values": [
        "allUsers",
        "allAuthenticatedUsers"
      ],
      "policy_type": "blacklist"
    }
  ],

  # Situation 3: Enforce valid IAM member format
  [
    {
      "situation_description": "IAM member format is invalid",
      "remedies": ["Use only members starting with user: or serviceAccount:"]
    },
    {
      "condition": "Invalid member format",
      "attribute_path": ["policy_data", "bindings", 0, "members", 0],
      "values": ["^(user|serviceAccount):[A-Za-z0-9@._-]+$"],
      "policy_type": "pattern whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message

