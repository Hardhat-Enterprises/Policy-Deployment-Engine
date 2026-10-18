resource "google_dataproc_session_template" "compliant_example_1" {
  project  = "test-project"
  name     = "compliant_example_1"
  location = "australia-southeast1"

  environment_config {
    execution_config {
      subnetwork_uri = "projects/my-project/regions/australia-southeast1/subnetworks/dataproc-secure"
    }
  }
}
