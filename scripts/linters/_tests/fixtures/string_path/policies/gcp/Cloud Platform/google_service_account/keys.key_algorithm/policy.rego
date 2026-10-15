package terraform.gcp.security.cloud_platform_service.google_service_account.keys_key_algorithm

import data.terraform.helpers
import data.terraform.gcp.security.cloud_platform_service.google_service_account.vars

conditions := [
  [
    {"situation_description": "Service account key uses a weak signing algorithm.",
     "remedies": ["Use KEY_ALG_RSA_2048 or stronger."]},
    {"condition": "Key algorithm must be strong",
     "attribute_path": "keys.key_algorithm",
     "values": ["KEY_ALG_RSA_2048"],
     "policy_type": "whitelist"}
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
