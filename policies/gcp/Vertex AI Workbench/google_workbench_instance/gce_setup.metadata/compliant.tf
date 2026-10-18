# Compliant — a single instance whose gce_setup.metadata satisfies every merged scenario
resource "google_workbench_instance" "compliant_example_1" {
  project  = "my-secure-project"
  name     = "compliant_example_1"
  location = "australia-southeast2-a"
  gce_setup {
    metadata = {
      "block-project-ssh-keys"     = "true"
      "idle-timeout-seconds"       = "3600"
      "notebook-disable-downloads" = "true"
      "notebook-disable-root"      = "true"
      "notebook-disable-terminal"  = "true"
    }
  }
}
