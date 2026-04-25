resource "google_apigee_instance" "c" {
  name                     = "c"
  location                 = "us-central1"
  org_id                   = "organizations/pde-org"
  disk_encryption_key_name = "projects/pde-proj/locations/us-central1/keyRings/pde-keyring/cryptoKeys/pde-key"
}