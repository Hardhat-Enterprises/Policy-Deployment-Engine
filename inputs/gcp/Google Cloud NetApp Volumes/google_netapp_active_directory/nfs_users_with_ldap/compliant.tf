resource "google_netapp_active_directory" "compliant_example_1" {
  project         = "deakin-lab-123"
  name            = "compliant_example_1"
  location        = "us-central1"
  domain          = "deakin.internal"
  dns             = "10.10.0.10"
  net_bios_prefix = "smbserver"
  username        = "user"
  password        = "pass"

  nfs_users_with_ldap = true
}