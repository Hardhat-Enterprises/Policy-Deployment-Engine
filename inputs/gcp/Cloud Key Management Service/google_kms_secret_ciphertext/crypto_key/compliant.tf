resource "google_kms_secret_ciphertext" "compliant_example_1" {
  # Must match one of the entries in policy.rego’s whitelist_keys
  crypto_key = "projects/my-project/locations/australia-southeast1/keyRings/approvedRing/cryptoKeys/approvedKey"
  plaintext  = "very-secret-data"
}
