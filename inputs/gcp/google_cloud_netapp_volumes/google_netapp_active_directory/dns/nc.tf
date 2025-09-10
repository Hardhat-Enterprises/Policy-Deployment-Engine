resource "google_netapp_active_directory" "nc_test_active_directory_full" {
  project         = "deakin-lab-123"
  name = "nc1"
  location = "us-central1"
  domain = ""
  dns = "172.30.64.3"
  net_bios_prefix = "smbserver"
  username = "user"
  password = "pass"
}

