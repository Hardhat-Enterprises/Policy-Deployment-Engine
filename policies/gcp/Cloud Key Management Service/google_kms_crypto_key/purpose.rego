package terraform.gcp.security.google_kms.google_kms_crypto_key.purpose

import data.terraform.helpers
import data.terraform.gcp.security.google_kms.google_kms_crypto_key.vars

# Merged policy for `purpose` — 2 independent scenarios, each a
# situation in `conditions`, evaluated separately by helpers.get_multi_summary.
conditions := [
[   
    {"situation_description" : "Purpose is not correct",
    "remedies":[ "Purpose must be ENCRYPT_DECRYPT or ASYMMETRIC_SIGN"]},
    {
        "condition": "Check purpose",
        "attribute_path" : ["purpose"],
        "values" : ["ENCRYPT_DECRYPT","ASYMMETRIC_SIGN"],
        "policy_type" : "whitelist" 
    }
    ],

    [
    {"situation_description" : "ASYMMETRIC SIGN but missing label true",
    "remedies":[ "ASYMMETRIC_SIGN purpose must have label set to true"]},
    {
        "condition": "Check purpose",
        "attribute_path" : ["purpose"],
        "values" : ["ASYMMETRIC_SIGN"],
        "policy_type" : "blacklist" 
    },
    {
        "condition": "Check label",
        "attribute_path" : ["labels","signing"],
        "values" : ["true"],
        "policy_type" : "whitelist" 
    }

    ],
[
  {
    "situation_description": "ENCRYPT_DECRYPT keys must rotate every 30 days",
    "remedies": ["For ENCRYPT_DECRYPT, rotation period must be ≤ 30 days"]
  },
  {
    "condition": "Purpose check",
    "attribute_path": ["purpose"],
    "values": ["ENCRYPT_DECRYPT", "ASYMMETRIC_SIGN"],
    "policy_type": "whitelist"
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
    "attribute_path": ["labels", "env"],
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

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
