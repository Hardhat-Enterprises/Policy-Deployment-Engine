package terraform.gcp.security.google_kms.google_kms_crypto_key.scheduled_rotation_period
import data.terraform.gcp.helpers as helpers
import data.terraform.gcp.security.google_kms.google_kms_crypto_key.vars as vars


conditions :=[
  
  [
  {
    "situation_description": "ENCRYPT_DECRYPT keys must rotate every 30 days",
    "remedies": ["For ENCRYPT_DECRYPT, rotation period must be ≤ 30 days"]
  },
  {
    "condition": "Purpose check",
    "attribute_path": ["purpose"],
    "values": ["ENCRYPT_DECRYPT"],
    "policy_type": "blacklist"
  },
  {
    "condition": "Rotation period check",
    "attribute_path": ["rotation_period"],
    "values": ["2592000s"],  # 30 days
    "policy_type": "whitelist"
  }
  ],

  [ 
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


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
