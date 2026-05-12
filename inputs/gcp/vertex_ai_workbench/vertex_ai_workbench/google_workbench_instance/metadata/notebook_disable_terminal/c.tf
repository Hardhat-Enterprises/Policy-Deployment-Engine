resource "google_workbench_instance" "c1" {
  project  = "my-secure-project"
  name     = "c1"
  location = "australia-southeast2-a"
  gce_setup {
    metadata = {
      "notebook-disable-terminal" = "true"
    }
  }
}
