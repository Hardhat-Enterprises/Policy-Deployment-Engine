package terraform.gcp.security.binary_authorization.google_binary_authorization_attestor.signature_algorithm

import data.terraform.gcp.helpers
import data.terraform.gcp.security.binary_authorization.google_binary_authorization_attestor.vars

conditions := [
  [
    {
      "situation_description": "Attestor uses an insecure signature algorithm",
      "remedies": [
        "Use RSA_PSS with at least a 2048-bit key, or ECDSA_P256_SHA256"
      ]
    },
    {
      "condition": "Signature algorithm must be secure",
      "attribute_path": ["attestation_authority_note", 0, "public_keys", 0, "pkix_public_key", "signature_algorithm"],
      "values": [
        "RSA_PSS_(2048|3072|4096)_SHA256",
        "ECDSA_P256_SHA256"                 
      ],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
