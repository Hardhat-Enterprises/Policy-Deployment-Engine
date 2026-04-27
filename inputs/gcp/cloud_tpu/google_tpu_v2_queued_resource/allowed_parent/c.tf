resource "google_tpu_v2_queued_resource" "qr_compliant" {
  provider = google-beta

  name    = "test-qr"
  zone    = "us-central1-c"
  project = "my-project-name"

  tpu {
    node_spec {
      parent  = "projects/my-project-name/locations/us-central1-c"
      node_id = "test-tpu"

      node {
        runtime_version  = "tpu-vm-tf-2.13.0"
        accelerator_type = "v2-8"
      }
    }
  }
}