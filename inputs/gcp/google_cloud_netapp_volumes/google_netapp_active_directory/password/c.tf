resource "google_netapp_active_directory" "c_test_active_directory_full" {
  project         = "deakin-lab-123"
  name = "test-active-directory-full"
  location = "us-central1"
  domain = "deakin.internal"
  dns = "172.30.64.3"
  net_bios_prefix = "smbserver"
  username = "svc_netapp_joiner"
  password = "Deakin!2025#NetApp"
}

