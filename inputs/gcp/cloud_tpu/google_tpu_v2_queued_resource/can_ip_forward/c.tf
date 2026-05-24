resource "google_tpu_v2_queued_resource" "c" {
  provider = google-beta
  name     = "c"
  project  = "fake-project"
  zone     = "australia-southeast1-a"

  tpu {
    node_spec {
      parent  = "projects/fake-project/locations/australia-southeast1-a"
      node_id = "c"

      node {
        runtime_version  = "tpu-vm-tf-2.13.0"
        accelerator_type = "v2-8"

        network_config {
          enable_external_ips = false
          can_ip_forward      = false
        }
      }
    }
  }
}