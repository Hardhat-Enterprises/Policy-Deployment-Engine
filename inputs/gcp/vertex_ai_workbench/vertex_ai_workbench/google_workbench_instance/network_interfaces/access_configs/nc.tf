resource "google_workbench_instance" "nc1" {
  project  = "my-secure-project"
  name     = "nc1"
  location = "australia-southeast2-a"
  gce_setup {
    network_interfaces {
      network = "projects/my-secure-project/global/networks/approved-vpc"
      access_configs {
        external_ip = "34.151.100.10"
      }
    }
  }
}
