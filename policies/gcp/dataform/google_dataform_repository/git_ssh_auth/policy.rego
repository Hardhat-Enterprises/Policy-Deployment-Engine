package terraform.gcp.security.dataform.google_dataform_repository.git_ssh_auth

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository.vars

conditions := [
  [
    {
      "situation_description": "Dataform repository must have ssh_authentication_config when using SSH.",
      "remedies": [
        "Configure ssh_authentication_config for SSH authentication.",
        "Ensure proper SSH key management."
      ]
    },
    {
      "condition": "git_remote_settings must not be null",
      "attribute_path": ["git_remote_settings"],
      "values": [null],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Dataform repository git_remote_settings must have ssh_authentication_config.",
      "remedies": [
        "Configure ssh_authentication_config for SSH authentication.",
        "Ensure proper SSH key management."
      ]
    },
    {
      "condition": "ssh_authentication_config must not be null",
      "attribute_path": ["ssh_authentication_config"],
      "values": [null],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Dataform repository ssh_authentication_config must have user_private_key_secret_version.",
      "remedies": [
        "Set user_private_key_secret_version in ssh_authentication_config.",
        "Use Secret Manager for private key storage."
      ]
    },
    {
      "condition": "user_private_key_secret_version must not be null",
      "attribute_path": ["user_private_key_secret_version"],
      "values": [null],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Dataform repository ssh_authentication_config user_private_key_secret_version cannot be empty.",
      "remedies": [
        "Set user_private_key_secret_version to a non-empty value.",
        "Use valid Secret Manager version path."
      ]
    },
    {
      "condition": "user_private_key_secret_version must not be empty",
      "attribute_path": ["user_private_key_secret_version"],
      "values": [""],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Dataform repository ssh_authentication_config must have host_public_key.",
      "remedies": [
        "Set host_public_key in ssh_authentication_config.",
        "Use valid SSH host public key."
      ]
    },
    {
      "condition": "host_public_key must not be null",
      "attribute_path": ["host_public_key"],
      "values": [null],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Dataform repository ssh_authentication_config host_public_key cannot be empty.",
      "remedies": [
        "Set host_public_key to a non-empty value.",
        "Use valid SSH host public key."
      ]
    },
    {
      "condition": "host_public_key must not be empty",
      "attribute_path": ["host_public_key"],
      "values": [""],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
