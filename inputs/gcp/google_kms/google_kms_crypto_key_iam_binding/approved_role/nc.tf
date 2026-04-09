# nc.tf - Non-compliant configurations for google_kms_crypto_key_iam_binding

# Violation 1: Role is NOT whitelisted
resource "google_kms_crypto_key_iam_binding" "nc1" {
  crypto_key_id = "nc1"
  role          = "roles/owner" #  Not in whitelist
  members = [
    "user:admin-user@example.com"
  ]
}

# Violation 2: Admin role used with a user (not service account)
resource "google_kms_crypto_key_iam_binding" "nc2" {
  crypto_key_id = "nc2"
  role          = "roles/cloudkms.admin" # Admin role
  members = [
    "user:admin-user@example.com" #  Should be a serviceAccount
  ]
}
