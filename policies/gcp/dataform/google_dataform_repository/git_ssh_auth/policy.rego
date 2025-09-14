package terraform.gcp.security.dataform.google_dataform_repository.git_ssh_auth

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository.vars

conditions := [
  [
    {"situation_description": "SSH Git auth must provide a private key secret version.",
     "remedies": [
       "Set ssh_authentication_config.user_private_key_secret_version to a valid secret version.",
       "Ensure the secret exists in Secret Manager."
     ]},
    {"condition": "SSH private key secret version must not be empty",
      "attribute_path": ["git_remote_settings", 0, "ssh_authentication_config", 0, "user_private_key_secret_version"],
      "values": [null, ""],
      "policy_type": "blacklist"}
  ],
  [
    {"situation_description": "SSH Git auth must provide a host public key.",
     "remedies": [
       "Provide ssh_authentication_config.host_public_key.",
       "Use the host's public key for SSH authentication."
     ]},
    {"condition": "SSH host public key must not be empty",
      "attribute_path": ["git_remote_settings", 0, "ssh_authentication_config", 0, "host_public_key"],
      "values": [null, ""],
      "policy_type": "blacklist"}
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
