package terraform.gcp.security.google_kms.google_kms_key_ring_import_job.import_method
import data.terraform.gcp.helpers as helpers
import data.terraform.gcp.security.google_kms.google_kms_key_ring_import_job.vars as vars

conditions := [

 
    [
    {
      "situation_description": "Import method uses SHA-1, which is deprecated",
      "remedies": ["Use a SHA-256–based wrapping method instead of any RSA_OAEP_*_SHA1_* variants"]
    },
    {
      "condition": "No SHA-1 methods allowed",
      "attribute_path": ["import_method"],
      "values": ["*_SHA1_*" ,[["RSA_OAEP_3072","RSA_OAEP_4096","RSA_OAEP_3072"],["AES_256"]]],
      "policy_type": "pattern blacklist"
    }
    ],

  
    [
    {
      "situation_description": "EXTERNAL protection level requires RSA_OAEP_4096_SHA256_AES_256",
      "remedies": ["When protection_level is EXTERNAL, set import_method to RSA_OAEP_4096_SHA256_AES_256"]
    },
    {
      "condition": "Protection level is EXTERNAL",
      "attribute_path": ["protection_level"],
      "values": ["EXTERNAL"],
      "policy_type": "whitelist"
    },
    {
      "condition": "Import method for EXTERNAL must be RSA_OAEP_4096_SHA256_AES_256",
      "attribute_path": ["import_method"],
      "values": ["RSA_OAEP_*_SHA1_AES_256", [["3072","4096"]]],
      "policy_type": "pattern blacklist"
    }
    ]

]


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details