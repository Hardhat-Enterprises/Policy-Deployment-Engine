resource "google_network_connectivity_regional_endpoint" "compliant_example_1" {
  name              = "compliant-regional-endpoint"
  location          = "us-central1"
  access_type       = "REGIONAL"
  target_google_api = "cloudkms.us-central1.rep.googleapis.com"
  deletion_policy   = "PREVENT"
}