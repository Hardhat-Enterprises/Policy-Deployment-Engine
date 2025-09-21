resource "google_kms_crypto_key" "c1" {
  name                       = "c1"
  key_ring                   = "example-key-ring"
  purpose                    = "ENCRYPT_DECRYPT" # Compliant: purpose is set as approved
  destroy_scheduled_duration = "2592000s"        # Compliant: set to the default 30 days


}