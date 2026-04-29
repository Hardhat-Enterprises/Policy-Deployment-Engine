resource "google_workbench_instance" "c1" {
  project  = "my-secure-project"
  name     = "workbench-instance"
  location = "australia-southeast2-a"
  gce_setup {
    shielded_instance_config {
      enable_secure_boot = true
    }
  }
}
