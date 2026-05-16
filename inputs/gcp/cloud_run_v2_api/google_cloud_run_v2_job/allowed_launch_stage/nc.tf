resource "google_cloud_run_v2_job" "nc1" {
  name                = "nc1"
  location            = "us-central1"
  deletion_protection = true
  launch_stage        = "ALPHA"
  project             = "my-project"

  template {
    template {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/job"
      }
    }
  }
}

resource "google_cloud_run_v2_job" "nc2" {
  name                = "nc2"
  location            = "us-central1"
  deletion_protection = true
  launch_stage        = "BETA"
  project             = "my-project"

  template {
    template {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/job"
      }
    }
  }
}