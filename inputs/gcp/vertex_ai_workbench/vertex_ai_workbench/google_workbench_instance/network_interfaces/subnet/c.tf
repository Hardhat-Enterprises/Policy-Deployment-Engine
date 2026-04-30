resource "google_workbench_instance" "c1" {
  project  = "my-secure-project"
  name     = "c1"
  location = "australia-southeast2-a"
  gce_setup {
    network_interfaces {
      subnet = "projects/my-secure-project/regions/australia-southeast2/subnetworks/approved-subnet"
    }
  }
}
