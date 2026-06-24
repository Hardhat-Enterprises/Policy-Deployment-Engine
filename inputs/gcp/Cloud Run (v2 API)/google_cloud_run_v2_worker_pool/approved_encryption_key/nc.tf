resource "google_cloud_run_v2_worker_pool" "nc" {
  name                = "nc"
  location            = "australia-southeast1"
  deletion_protection = false
  project             = "my-project"

  template {
    encryption_key = "projects/my-project/locations/us-central1/keyRings/random-keys/cryptoKeys/random-key"

    containers {
      image = "australia-docker.pkg.dev/my-project/secure-repo/worker:1.0.0"
    }
  }
}