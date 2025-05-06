package terraform.gcp.security.google_kms.google_kms_secret_ciphertext.crypto_key
import data.terraform.gcp.helpers as helpers
import data.terraform.gcp.security.google_kms.google_kms_secret_ciphertext.crypto_key.vars as vars


situations := [
  [
    {"situation_description" : "Unapproved KMS key used to encrypt data",
    "remedies":[ "Use one of the approved keys listed in the project policy"]},
    {
        "condition": "Test KMS key",
        "attribute_path" : ["crypto_key"],
        "values" : ["projects/my-project/locations/global/keyRings/approvedRing/cryptoKeys/approvedKey",
      "projects/my-project/locations/us-central1/keyRings/opsRing/cryptoKeys/opsKey"],
        "policy_type" : "whitelist" 
    }
    ]
]


summary := helpers.get_multi_summary(situations, vars.variables)
message = summary.message
