resource "google_netapp_active_directory" "non_compliant_example_1" {
  project         = "deakin-lab-123"
  name = "non_compliant_example_1"
  location = "us-central1"
  domain = ""
  dns = ""
  net_bios_prefix = "smbserver"
  username = ""
  password = ""
}

