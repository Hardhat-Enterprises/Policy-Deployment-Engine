resource "google_workbench_instance" "c1" {
  project  = "my-secure-project"
  name     = "c1"
  location = "australia-southeast2-a"
  gce_setup {
    confidential_instance_config {
      confidential_instance_type = "SEV"
    }
  }
}
