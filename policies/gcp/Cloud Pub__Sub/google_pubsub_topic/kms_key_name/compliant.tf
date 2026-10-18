resource "google_pubsub_topic" "compliant_example_1" {
  name         = "compliant_example_1"
  kms_key_name = "projects/my-project/locations/global/keyRings/my-ring/cryptoKeys/my-key"
}
