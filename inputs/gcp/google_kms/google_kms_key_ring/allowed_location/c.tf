resource "google_kms_key_ring" "c" {
    name = "complaint-key-ring"
    location = "australia-southeast1" #Complaint location
    project  = "your-project-id"  # Replace with your actual GCP project ID
}
