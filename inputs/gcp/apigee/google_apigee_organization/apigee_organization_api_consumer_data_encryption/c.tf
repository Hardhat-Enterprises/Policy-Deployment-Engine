
resource "google_apigee_organization" "c" {
  project_id                               = "c"
  analytics_region                         = "us-central1"
  disable_vpc_peering                      = true
  api_consumer_data_encryption_key_name    = "projects/pde-proj/locations/us-central1/keyRings/pde-keyring/cryptoKeys/pde-key"
}