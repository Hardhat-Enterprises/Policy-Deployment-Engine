resource "google_cloud_run_v2_job" "non_compliant_example_1" {
  name                = "non_compliant_example_1"
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

resource "google_cloud_run_v2_job" "non_compliant_example_2" {
  name                = "non_compliant_example_2"
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
