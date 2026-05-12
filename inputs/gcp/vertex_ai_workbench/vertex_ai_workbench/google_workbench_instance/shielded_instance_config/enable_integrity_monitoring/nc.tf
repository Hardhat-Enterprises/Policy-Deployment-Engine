resource "google_workbench_instance" "nc1" {
  project  = "my-secure-project"
  name     = "nc1"
  location = "australia-southeast2-a"
  gce_setup {
    shielded_instance_config {
      enable_integrity_monitoring = false
    }
  }
}
