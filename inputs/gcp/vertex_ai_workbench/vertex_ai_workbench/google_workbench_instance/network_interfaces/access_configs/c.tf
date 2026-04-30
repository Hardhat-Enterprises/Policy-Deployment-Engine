resource "google_workbench_instance" "c1" {
  project  = "my-secure-project"
  name     = "workbench-instance"
  location = "australia-southeast2-a"
  gce_setup {
    network_interfaces {
      network = "projects/my-secure-project/global/networks/approved-vpc"
    }
  }
}
