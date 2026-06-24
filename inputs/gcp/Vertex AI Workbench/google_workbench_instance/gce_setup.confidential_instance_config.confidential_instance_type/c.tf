resource "google_workbench_instance" "c" {
  project  = "my-secure-project"
  name     = "c"
  location = "australia-southeast2-a"
  gce_setup {
    confidential_instance_config {
      confidential_instance_type = "SEV"
    }
  }
}
