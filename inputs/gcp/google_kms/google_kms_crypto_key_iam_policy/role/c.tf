# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

data "google_iam_policy" "compliant"{
    binding {
    role = "roles/cloudkms.cryptoKeyEncrypterDecrypter"

    members = [
      "user:compliant-user@example.com",
      "serviceAccount:encrypt-sa@my-project.iam.gserviceaccount.com",
    ]
  }
}

resource "google_kms_crypto_key_iam_policy" "c" {
    crypto_key_id = "projects/my-project/locations/global/keyRings/my-keyring/cryptoKeys/my-key"
    policy_data = data.google_iam_policy.compliant.policy_data
}


