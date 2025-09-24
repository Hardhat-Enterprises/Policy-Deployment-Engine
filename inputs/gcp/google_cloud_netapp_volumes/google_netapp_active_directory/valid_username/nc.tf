resource "google_netapp_active_directory" "nc1" {
  project         = "deakin-lab-123"
  name = "nc1"
  location = "us-central1"
  domain = ""
  dns = ""
  net_bios_prefix = "smbserver"
  username = ""
  password = "pass"
}

