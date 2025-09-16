package terraform.gcp.security.cloud_platform_service.google_service_account_key.exposure

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_platform_service.google_service_account_key.vars

conditions := [
  [  # Weak algorithm
    {
      "situation_description": "Insecure key algorithm used.",
      "remedies": ["Use only 'KEY_ALG_RSA_2048' for cryptographic strength."]
    },
    {
      "condition": "Insecure key algorithm",
      "attribute_path": ["key_algorithm"],
      "values": ["KEY_ALG_RSA_1024"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
