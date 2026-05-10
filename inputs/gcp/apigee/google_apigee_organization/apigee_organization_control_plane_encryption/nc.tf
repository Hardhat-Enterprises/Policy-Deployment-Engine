resource "google_apigee_organization" "nc" {
  project_id                        = "nc"
  analytics_region                  = "australia-southeast1"
  disable_vpc_peering               = true
  control_plane_encryption_key_name = "projects/pde-proj/locations/us-central1/keyRings/pde-keyring/cryptoKeys/pde-key"
}
