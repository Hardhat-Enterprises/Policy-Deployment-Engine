# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_kms_key_ring" "nc" {
  name     = "test-keyring-temp"
  location = "europe-west1"  # Non-compliant location
  project  = "your-project-id"  # Replace with your actual GCP project ID
}

  
