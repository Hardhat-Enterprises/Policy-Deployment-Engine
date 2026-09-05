resource "google_compute_disk" "non_compliant_example_1" {
  name  = "non-compliant-example-1"
  zone  = "australia-southeast1-a"
  image = "projects/debian-cloud/global/images/debian-11-bullseye-v20240110"

  source_image_encryption_key {
  }
}