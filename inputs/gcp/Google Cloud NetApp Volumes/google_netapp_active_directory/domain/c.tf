resource "google_netapp_active_directory" "c1" {
  project         = "deakin-lab-123"
  name = "c1"
  location = "us-central1"
  domain = "deakin.internal"
  dns = "172.30.64.3"
  net_bios_prefix = "smbserver"
  username = "user"
  password = "pass"
}

