resource "google_compute_disk" "non_compliant_example_1" {
  name  = "non-compliant-example-1"
  zone  = "australia-southeast1-a"
  type  = "pd-ssd"
  image = "debian-cloud/debian-12"

  guest_os_features {
    type = "MULTI_IP_SUBNET"
  }
}