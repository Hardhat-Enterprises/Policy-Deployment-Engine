# 1 key isn’t on the approved list
resource "google_kms_secret_ciphertext" "nc" {
  crypto_key = "projects/my-project/locations/global/keyRings/badRing/cryptoKeys/badKey"
  plaintext  = "very-secret-data"
}

# 2 malformed path (doesn’t match expected pattern)
resource "google_kms_secret_ciphertext" "nc2" {
  crypto_key = "myproject/global/approvedRing/cryptoKeys/approvedKey"
  plaintext  = "very-secret-data"
}