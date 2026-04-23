resource "google_tpu_v2_queued_resource" "qr" {
  provider = google-beta

  name    = "test-qr"
  zone    = "asia-east1-a"   # ❌ forbidden
  project = "my-project-name"

  tpu {
    node_spec {
      parent  = "projects/my-project-name/locations/asia-east1-a"  # ❌ forbidden
      node_id = "test-tpu"

      node {
        runtime_version  = "tpu-vm-tf-2.13.0"
        accelerator_type = "v2-8"
      }
    }
  }
}