resource "google_netapp_active_directory" "c_test_active_directory_full" {
  project         = "deakin-lab-123"
  name = "c1"
  location = "us-central1"
  domain = "deakin.internal"
  dns = "10.10.0.10,10.10.0.11"
  net_bios_prefix = "smbserver"
  username = "user"
  password = "pass"
}

