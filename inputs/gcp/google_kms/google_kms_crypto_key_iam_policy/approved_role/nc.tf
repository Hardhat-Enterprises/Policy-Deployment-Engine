data "google_iam_policy" "non_compliant" {
  binding {
    role = "roles/owner"

    members = [
      "allUsers",
      "group:admins@example.com",
      "user:unauthorized-user@example.com",
    ]
  }
}


resource "google_kms_crypto_key_iam_policy" "nc1" {
  crypto_key_id = "projects/my-project/locations/global/keyRings/my-keyring/cryptoKeys/my-key"
  policy_data   = data.google_iam_policy.non_compliant.policy_data
}

