resource "google_compute_image" "non_compliant_example_1" {
  name = "non-compliant-example-1"

  source_disk = "projects/pde-demo/zones/us-central1-a/disks/example-disk"

  guest_os_features {
    type = "MULTI_IP_SUBNET"
  }
}