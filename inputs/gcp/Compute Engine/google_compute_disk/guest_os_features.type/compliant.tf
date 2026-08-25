resource "google_compute_disk" "compliant_example_1" {
  name  = "compliant-example-1"
  zone  = "australia-southeast1-a"
  type  = "pd-ssd"
  image = "debian-cloud/debian-12"

  guest_os_features {
    type = "SECURE_BOOT"
  }
}