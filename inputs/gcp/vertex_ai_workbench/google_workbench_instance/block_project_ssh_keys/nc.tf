resource "google_workbench_instance" "nc" {
  project  = "my-secure-project"
  name     = "nc"
  location = "australia-southeast2-a"
  gce_setup {
    metadata = {
      "block-project-ssh-keys" = "false"
    }
  }
}
