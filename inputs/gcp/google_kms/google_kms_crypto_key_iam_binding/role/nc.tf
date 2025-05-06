# nc.tf - Non-compliant configuration sample for google_kms_crypto_key_iam

resource "google_kms_crypto_key_iam_binding" "nc" {
  crypto_key_id = "projects/my-project/locations/global/keyRings/my-keyring/cryptoKeys/my-key"
  role          = "roles/owner"  # Unapproved role, this should trigger the policy
  members       = [
    "user:unauthorized@example.com"
  ]
}
