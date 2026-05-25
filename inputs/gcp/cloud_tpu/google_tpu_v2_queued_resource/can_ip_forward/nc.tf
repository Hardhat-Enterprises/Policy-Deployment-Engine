resource "google_tpu_v2_queued_resource" "nc" {
  provider = google-beta
  name     = "nc"
  project  = "fake-project"
  zone     = "australia-southeast1-a"

  tpu {
    node_spec {
      parent  = "projects/fake-project/locations/australia-southeast1-a"
      node_id = "nc"

      node {
        runtime_version  = "tpu-vm-tf-2.13.0"
        accelerator_type = "v2-8"

        network_config {
          enable_external_ips = false
          can_ip_forward      = true
        }
      }
    }
  }
}