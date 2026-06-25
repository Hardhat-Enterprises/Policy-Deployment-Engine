resource "google_cloud_run_v2_job" "non_compliant_example_1" {
  name                = "non_compliant_example_1"
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

resource "google_cloud_run_v2_job" "non_compliant_example_2" {
  name                = "non_compliant_example_2"
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
