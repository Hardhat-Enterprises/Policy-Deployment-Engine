package terraform.gcp.security.cloud_pub_sub.google_pubsub_topic.kms_key_name

import data.terraform.helpers
import data.terraform.gcp.security.cloud_pub_sub.google_pubsub_topic.vars

conditions := [
  [
    {"situation_description": "Pub/Sub Topic does not have a customer-managed encryption key (CMEK) configured.",
     "remedies": [
       "Set 'kms_key_name' to a valid Cloud KMS CryptoKey resource name.",
       "Ensure the Pub/Sub service account has 'roles/cloudkms.cryptoKeyEncrypterDecrypter' on the key.",
       "Use format: projects/{project}/locations/{location}/keyRings/{keyRing}/cryptoKeys/{cryptoKey}"
     ]},
    {
      "condition": "kms_key_name is null or empty — CMEK is not configured.",
      "attribute_path": ["kms_key_name"],
      "values": [null, ""],
      "policy_type": "blacklist"
    }
  ]
]

result = helpers.get_multi_summary(conditions, vars.variables)
message = result.message
details = result.details
