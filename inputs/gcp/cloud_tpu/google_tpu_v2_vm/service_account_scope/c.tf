resource "google_tpu_v2_vm" "c" {
  provider         = google-beta
  name             = "c"
  zone             = "us-central1-c"
  project          = "fake-project"
  runtime_version  = "tpu-vm-tf-2.13.0"
  accelerator_type = "v2-8"

  shielded_instance_config {
    enable_secure_boot = true
  }

  network_config {
    enable_external_ips = false
  }

  service_account {
    email = "tpu-sa@fake-project.iam.gserviceaccount.com"
    scope = ["https://www.googleapis.com/auth/devstorage.read_only"]
  }
}