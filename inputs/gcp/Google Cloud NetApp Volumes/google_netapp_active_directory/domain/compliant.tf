resource "google_netapp_active_directory" "compliant_example_1" {
  project         = "deakin-lab-123"
  name = "compliant_example_1"
  location = "us-central1"
  domain = "deakin.internal"
  dns = "172.30.64.3"
  net_bios_prefix = "smbserver"
  username = "user"
  password = "pass"
}

