package terraform.gcp.security.cloud_platform_service.google_service_account_key.exposure

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_platform_service.google_service_account_key.vars

conditions := [
  [  # Rule 1: Private key should not be exported
    {
      "situation_description": "Private key must not be exported as TYPE_GOOGLE_CREDENTIALS_FILE.",
      "remedies": [
        "Avoid exporting private key. Use Workload Identity or keep private_key_type = null."
      ]
    },
    {
      "condition": "Sensitive key output risk",
      "attribute_path": "private_key_type",
      "values": ["TYPE_GOOGLE_CREDENTIALS_FILE"],
      "policy_type": "blacklist"
    }
  ],
  [  # Rule 2: Rotation must be present
    {
      "situation_description": "Service account key must be rotated regularly.",
      "remedies": [
        "Use 'keepers' with rotation_time and a 'time_rotating' resource to enforce rotation."
      ]
    },
    {
      "condition": "Missing key rotation configuration",
      "attribute_path": "keepers",  # change from nested path
      "values": [null],
      "policy_type": "blacklist"
    }
  ],
  [  # Rule 3: Weak algorithm
    {
      "situation_description": "Insecure key algorithm used.",
      "remedies": ["Use only 'KEY_ALG_RSA_2048' for cryptographic strength."]
    },
    {
      "condition": "Insecure key algorithm",
      "attribute_path": "key_algorithm",
      "values": ["KEY_ALG_RSA_1024"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
