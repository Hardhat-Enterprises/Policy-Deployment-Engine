resource "google_cloud_run_v2_job" "nc1" {
  name                = "nc1"
  location            = "australia-southeast1"
  deletion_protection = true
  project             = "my-project"

  # Missing binary_authorization block

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
  location            = "australia-southeast1"
  deletion_protection = true
  project             = "my-project"

  binary_authorization {
    use_default = false #set to false
  }

  template {
    template {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/job"
      }
    }
  }
}