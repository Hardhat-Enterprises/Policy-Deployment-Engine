package terraform.gcp.security.binary_authorization.google_binary_authorization_attestor.signature_algorithm

import data.terraform.gcp.helpers
import data.terraform.gcp.security.binary_authorization.google_binary_authorization_attestor.vars

conditions := [
  [
    {
      "situation_description": "Attestor uses an insecure signature algorithm",
      "remedies": [
        "Use RSA_PSS_2048_SHA256 or stronger algorithms"
      ]
    },
    {
      "condition": "Signature algorithm must be secure",
      "attribute_path": ["attestation_authority_note", 0, "public_keys", 0, "pkix_public_key", "signature_algorithm"],
      "values": ["RSA_PSS_2048_SHA256", "RSA_PSS_3072_SHA256", "RSA_PSS_4096_SHA256", "ECDSA_P256_SHA256"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details