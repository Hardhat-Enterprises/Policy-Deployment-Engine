resource "google_workbench_instance" "nc1" {
  project  = "my-secure-project"
  name     = "nc1"
  location = "australia-southeast2-a"
  gce_setup {
    metadata = {
      "notebook-disable-downloads" = "false"
    }
  }
}
