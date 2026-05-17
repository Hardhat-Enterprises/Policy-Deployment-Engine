resource "google_workbench_instance" "c" {
  project  = "my-secure-project"
  name     = "c"
  location = "australia-southeast2-a"
  gce_setup {
    network_interfaces {
      network = "projects/my-secure-project/global/networks/approved-vpc"
    }
  }
}
