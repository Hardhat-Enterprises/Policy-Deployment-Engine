# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_dataset" "c" {
    name = "testdataset-c"
    location = "australia-southeast1"
    project = "project"

    encryption_spec {
    kms_key_name = "projects/project/locations/australia-southeast1/keyRings/my-keyring/cryptoKeys/my-encryption-key"
  }
}
