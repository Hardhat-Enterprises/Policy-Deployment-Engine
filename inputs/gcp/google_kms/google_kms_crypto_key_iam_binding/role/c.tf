# c.tf - Compliant configuration for google_kms_crypto_key_iam_binding
resource "google_kms_crypto_key_iam_binding" "c" {
  crypto_key_id = "projects/my-project/locations/global/keyRings/my-keyring/cryptoKeys/my-key"
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"  # Approved role
  members       = [
    "serviceAccount:secure-sa@my-project.iam.gserviceaccount.com"  # Safe principal
  ]
}
