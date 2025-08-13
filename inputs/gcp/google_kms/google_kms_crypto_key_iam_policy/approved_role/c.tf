data "google_iam_policy" "compliant"{
    binding {
    role = "roles/cloudkms.cryptoKeyEncrypterDecrypter"

    members = [
      "serviceAccount:admin-user@example.com",
    ]
  }
}

resource "google_kms_crypto_key_iam_policy" "c1" {
    crypto_key_id = "projects/my-project/locations/global/keyRings/my-keyring/cryptoKeys/my-key"
    policy_data = data.google_iam_policy.compliant.policy_data
}


