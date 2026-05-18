resource "google_cloud_run_v2_worker_pool" "nc" {
  name                = "nc"
  location            = "australia-southeast1"
  deletion_protection = false
  project             = "my-project"

  template {
    encryption_key_revocation_action = "PREVENT_NEW"

    containers {
      image = "australia-docker.pkg.dev/my-project/secure-repo/worker:1.0.0"
    }
  }
}