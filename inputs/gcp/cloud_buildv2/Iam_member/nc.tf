# Non-compliant resource: Bad location, elevated privileges, and external user
resource "google_cloudbuildv2_connection_iam_member" "nc" {
  name      = "insecure-connection-member"       # Non-standard name
  project   = "policy-deplo"                     # Valid project
  location  = "us-central1"                      # Not "global"
  // connection = ""                             # Missing connection field
  role      = "roles/owner"                      # Elevated privilege
  member    = "allUsers"                         
}
# # Non-compliant resource: Bad location, elevated privileges, and external user
# resource "google_cloudbuildv2_connection_iam_member" "nc" 
