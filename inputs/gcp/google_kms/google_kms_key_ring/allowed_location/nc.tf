resource "google_kms_key_ring" "nc" {
  name     = "test-keyring-temp"
  location = "europe-west1"  # Non-compliant location
  project  = "your-project-id"  # Replace with your actual GCP project ID
}

  
