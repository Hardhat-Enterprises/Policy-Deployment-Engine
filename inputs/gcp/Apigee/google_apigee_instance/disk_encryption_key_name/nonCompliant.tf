resource "google_apigee_instance" "non_compliant_example_1" {
  name                     = "non_compliant_example_1"
  location                 = "australia-southeast1"
  org_id                   = "organizations/pde-org"
  disk_encryption_key_name = "projects/pde-proj/locations/us-central1/keyRings/pde-keyring/cryptoKeys/pde-key"
}
