resource "google_workbench_instance" "c" {
  project  = "my-secure-project"
  name     = "c"
  location = "australia-southeast2-a"
  gce_setup {
    network_interfaces {
      subnet = "projects/my-secure-project/regions/australia-southeast2/subnetworks/approved-subnet"
    }
  }
}
