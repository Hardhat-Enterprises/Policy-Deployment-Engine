# c.tf - Compliant configuration for google_kms_crypto_key_iam_binding
resource "google_kms_crypto_key_iam_binding" "c1" {
  crypto_key_id = "c1"
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter" 
  members = [
    "serviceAccount:admin-user@example.com" # Safe principal
  ]
}
