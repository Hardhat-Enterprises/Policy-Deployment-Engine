resource "google_compute_region_disk" "non_compliant_example_1" {
  name    = "non-compliant-source-image-raw-key-disk"
  project = "fake-project"
  region  = "us-central1"

  type = "pd-ssd"
  size = 200

  replica_zones = [
    "us-central1-a",
    "us-central1-f"
  ]

  source_image_encryption_key {
    raw_key = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="
  }
}