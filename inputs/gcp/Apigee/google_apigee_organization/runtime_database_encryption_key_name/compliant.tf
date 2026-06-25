resource "google_apigee_organization" "compliant_example_1" {
  project_id                           = "compliant_example_1"
  analytics_region                     = "australia-southeast1"
  disable_vpc_peering                  = true
  runtime_database_encryption_key_name = "projects/pde-proj/locations/australia-southeast1/keyRings/pde-keyring/cryptoKeys/pde-key"
}
