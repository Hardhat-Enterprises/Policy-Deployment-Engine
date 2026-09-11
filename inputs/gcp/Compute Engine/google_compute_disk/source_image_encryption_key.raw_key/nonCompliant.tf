resource "google_compute_disk" "non_compliant_example_1" {
  name  = "non-compliant-example-1"
  zone  = "australia-southeast1-a"
  type  = "pd-ssd"
  image = "projects/my-project/global/images/my-encrypted-image"

  source_image_encryption_key {
    raw_key = "SGVsbG8gZnJvbSBHb29nbGUgQ2xvdWQgUGxhdGZvcm0="
  }
}