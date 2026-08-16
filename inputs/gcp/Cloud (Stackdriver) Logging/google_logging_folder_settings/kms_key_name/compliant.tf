# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant
resource "google_logging_folder_settings" "compliant_example_1" {
  folder       = "compliant_example_1"
  kms_key_name = "projects/key-project/locations/us-central1/keyRings/my-ring/cryptoKeys/my-key"
}