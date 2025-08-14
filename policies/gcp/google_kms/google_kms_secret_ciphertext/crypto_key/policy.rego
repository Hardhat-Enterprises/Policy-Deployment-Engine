package terraform.gcp.security.google_kms.google_kms_secret_ciphertext.crypto_key
import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_kms.google_kms_secret_ciphertext.vars

situations := [

    [
    {
      "situation_description": "Unapproved KMS key used to encrypt data",
      "remedies": ["Use one of the approved keys in australia"]
    },
    {
      "condition": "Only approved crypto_key from australia allowed",
      "attribute_path": ["crypto_key"],
      "values": ["projects/my-project/locations/*/keyRings/approvedRing/cryptoKeys/approvedKey",[["australia-southeast1", "australia-southeast2"]]],
      "policy_type": "pattern whitelist"
    }
    ]
]

message := helpers.get_multi_summary(situations, vars.variables).message
details := helpers.get_multi_summary(situations, vars.variables).details
