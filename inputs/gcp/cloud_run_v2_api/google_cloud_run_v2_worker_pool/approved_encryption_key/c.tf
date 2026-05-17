resource "google_cloud_run_v2_worker_pool" "c" {
  name                = "c"
  location            = "australia-southeast1"
  deletion_protection = false
  project             = "my-project"

  template {
    encryption_key = "projects/my-project/locations/australia-southeast1/keyRings/my-keyring/cryptoKeys/my-key"

    containers {
      image = "australia-docker.pkg.dev/my-project/secure-repo/worker:1.0.0"
    }
  }
}