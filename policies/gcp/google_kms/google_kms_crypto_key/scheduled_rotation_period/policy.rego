package terraform.gcp.security.google_kms.google_kms_crypto_key.rotation 
import data.terraform.gcp.helpers as helpers
import data.terraform.gcp.security.google_kms.google_kms_crypto_key.vars as vars


conditions :=[
[ #1. If purpose is ENCRYPT_DECRYPT, enforce = 30 days
  {
    "situation_description": "ENCRYPT_DECRYPT keys must rotate every 30 days",
    "remedies": ["For ENCRYPT_DECRYPT, rotation period must be ≤ 30 days"]
  },
  {
    "condition": "Purpose check",
    "attribute_path": ["purpose"],
    "values": ["ENCRYPT_DECRYPT"],
    "policy_type": "whitelist"
  },
  {
    "condition": "Rotation period check",
    "attribute_path": ["rotation_period"],
    "values": ["2592000s"],  # 30 days
    "policy_type": "whitelist"
  }
],
[ #2.If label env=prod, enforce = 30 days
  {
    "situation_description": "Production keys must rotate every 30 days",
    "remedies": ["Keys labeled 'env=prod' must have a short rotation"]
  },
  {
    "condition": "Label check",
    "attribute_path": ["labels", 0, "env"],
    "values": ["prod"],
    "policy_type": "whitelist"
  },
  {
    "condition": "Rotation period check",
    "attribute_path": ["rotation_period"],
    "values": ["2592000s"],
    "policy_type": "whitelist"
  }
]

]


# Generate a summary which includes total count and non-compliant details.
message := helpers.get_multi_summary(conditions, vars.variables)
