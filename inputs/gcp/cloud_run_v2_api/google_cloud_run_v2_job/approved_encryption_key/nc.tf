resource "google_cloud_run_v2_job" "nc1" {
  name                = "nc1"
  location            = "australia-southeast1"
  deletion_protection = false
  project             = "my-project"

  template {
    template {
      encryption_key = "projects/my-project/locations/australia-southeast1/keyRings/unsafe-keys/cryptoKeys/unsafe-key"

      containers {
        image = "us-docker.pkg.dev/cloudrun/container/job"
      }
    }
  }
}

resource "google_cloud_run_v2_job" "nc2" {
  name                = "nc2"
  location            = "australia-southeast1"
  deletion_protection = false
  project             = "my-project"

  template {
    template {
      encryption_key = "projects/my-project/locations/us-central1/keyRings/unsafe-keys/cryptoKeys/unsafe-key"

      containers {
        image = "us-docker.pkg.dev/cloudrun/container/job"
      }
    }
  }
}