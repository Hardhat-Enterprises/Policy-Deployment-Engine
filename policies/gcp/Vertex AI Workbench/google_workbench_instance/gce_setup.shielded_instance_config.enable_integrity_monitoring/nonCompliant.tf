resource "google_workbench_instance" "non_compliant_example_1" {
  project  = "my-secure-project"
  name     = "non_compliant_example_1"
  location = "australia-southeast2-a"
  gce_setup {
    shielded_instance_config {
      enable_integrity_monitoring = false
    }
  }
}
