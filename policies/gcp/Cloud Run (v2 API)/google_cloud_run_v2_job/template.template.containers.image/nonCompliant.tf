resource "google_cloud_run_v2_job" "non_compliant_example_1" {
  name                = "non_compliant_example_1"
  location            = "australia-southeast1"
  deletion_protection = true
  project             = "my-project"

  template {
    template {
      containers {
        image = "gcr.io/my-project/unauthorized-image"
      }
    }
  }
}
