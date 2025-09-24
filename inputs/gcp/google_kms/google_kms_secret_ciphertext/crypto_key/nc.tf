# 1 key isn’t on the approved list
resource "google_kms_secret_ciphertext" "nc1" {
  crypto_key = "projects/my-project/locations/us-central1/keyRings/approvedRing/cryptoKeys/approvedKey"
  plaintext  = "very-secret-data"
}

