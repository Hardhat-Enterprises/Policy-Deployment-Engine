resource "google_pubsub_topic" "c" {
  name         = "c"
  kms_key_name = "projects/my-project/locations/global/keyRings/my-ring/cryptoKeys/my-key"
}
