resource "google_apigee_instance" "compliant_example_1" {
  name                     = "compliant_example_1"
  location                 = "australia-southeast1"
  org_id                   = "organizations/pde-org"
  disk_encryption_key_name = "projects/pde-proj/locations/australia-southeast1/keyRings/pde-keyring/cryptoKeys/pde-key"
}
