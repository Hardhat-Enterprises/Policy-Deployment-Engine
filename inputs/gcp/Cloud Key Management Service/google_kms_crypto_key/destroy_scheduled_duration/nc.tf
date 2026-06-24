resource "google_kms_crypto_key" "nc1" {
  name                       = "nc1"
  key_ring                   = "example-key-ring"
  purpose                    = "ENCRYPT_DECRYPT" # Non-compliant: purpose must be "ENCRYPT_DECRYPT"
  destroy_scheduled_duration = "604800s"         # Non-compliant: not set to the default 30 days
}


