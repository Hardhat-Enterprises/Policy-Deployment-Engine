resource "google_compute_image" "non_compliant_example_1" {
  name        = "non-compliant-example-1"
  source_disk = "projects/pde-demo/zones/us-central1-a/disks/example-disk"

  shielded_instance_initial_state {
    pk {
      content   = "dGVzdC1jZXJ0aWZpY2F0ZQ=="
      file_type = "PEM"
    }
  }
}