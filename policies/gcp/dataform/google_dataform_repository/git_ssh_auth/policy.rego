package terraform.gcp.security.dataform.google_dataform_repository.git_ssh_auth

import data.terraform.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository as repo

# This policy enforces: if a repo uses SSH authentication,
# then both user_private_key_secret_version and host_public_key must be set.
#
# We implement this with two separate situations:
#  - Situation 1: If SSH auth is configured, private key must be set
#  - Situation 2: If SSH auth is configured, host public key must be set

conditions := [
  # ── Situation 1: SSH private key required
  [
    {
      "situation_description": "SSH private key secret is missing",
      "remedies": [
        "Set git_remote_settings.ssh_authentication_config.user_private_key_secret_version to a Secret Manager version.",
        "Ensure the private key is stored securely in Google Secret Manager."
      ]
    },
    {
      "condition": "SSH authentication is configured",
      "attribute_path": ["git_remote_settings", 0, "ssh_authentication_config"],
      "policy_type": "whitelist",
      "values": [null, []]
    },
    {
      "condition": "SSH private key secret must be set",
      "attribute_path": ["git_remote_settings", 0, "ssh_authentication_config", 0, "user_private_key_secret_version"],
      "policy_type": "blacklist",
      "values": [null, ""]
    }
  ],

  # ── Situation 2: SSH host public key required
  [
    {
      "situation_description": "SSH host public key is missing",
      "remedies": [
        "Set git_remote_settings.ssh_authentication_config.host_public_key to the server's public key.",
        "This protects against MITM attacks by pinning the trusted host key."
      ]
    },
    {
      "condition": "SSH authentication is configured",
      "attribute_path": ["git_remote_settings", 0, "ssh_authentication_config"],
      "policy_type": "whitelist",
      "values": [null, []]
    },
    {
      "condition": "SSH host public key must be set",
      "attribute_path": ["git_remote_settings", 0, "ssh_authentication_config", 0, "host_public_key"],
      "policy_type": "blacklist",
      "values": [null, ""]
    }
  ]
]

message := helpers.get_multi_summary(conditions, repo.variables).message
details := helpers.get_multi_summary(conditions, repo.variables).details
