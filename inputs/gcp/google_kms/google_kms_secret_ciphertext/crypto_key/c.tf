# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_kms_secret_ciphertext" "c" {
  # Must match one of the entries in policy.rego’s whitelist_keys
  crypto_key = "projects/my-project/locations/global/keyRings/approvedRing/cryptoKeys/approvedKey"
  plaintext  = "very-secret-data"
}
