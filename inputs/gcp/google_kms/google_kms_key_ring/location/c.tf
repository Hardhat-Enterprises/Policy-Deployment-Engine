# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_kms_key_ring" "c" {
    name = "complaint-key-ring"
    location = "us-central1" #Complaint location
    project  = "your-project-id"  # Replace with your actual GCP project ID
}
