resource "google_workbench_instance" "nc" {
  project  = "my-secure-project"
  name     = "nc"
  location = "australia-southeast2-a"
  gce_setup {
    shielded_instance_config {
      enable_vtpm = false
    }
  }
}
