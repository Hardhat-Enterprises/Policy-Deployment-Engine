package terraform.gcp.security.google_kms.google_kms_secret_ciphertext.crypto_key
import data.terraform.gcp.helpers as helpers
import data.terraform.gcp.security.google_kms.google_kms_key_ring.vars


#Define your ONE (or more) checks here
situations := [
  {
    "condition":            "Only approved keys",
    "attribute_path":       ["crypto_key"],
    "policy_type":          "whitelist",
    "values": [
      "projects/my-project/locations/global/keyRings/approvedRing/cryptoKeys/approvedKey",
      "projects/my-project/locations/us-central1/keyRings/opsRing/cryptoKeys/opsKey",
    ],
    "situation_description": "Unapproved KMS key used to encrypt data",
    "remedies": [
      "Use one of the approved keys listed in the project policy",
      "If you need a new key, request that it be added to the whitelist"
    ]
  }
]

#Kick off all checks with one call
#summary := helpers.get_multi_summary(situations, vars)

