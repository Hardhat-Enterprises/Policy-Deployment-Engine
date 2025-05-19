# Compliant resource: IAM member with valid user, role, and location
resource "google_cloudbuildv2_connection_iam_member" "c" {
  name      = "secure-connection-member"
  project   = "policy-deplo"
  location  = "global"
  // connection = "secure-connection" # You may uncomment if you plan to enforce connection-level binding
  role      = "roles/viewer"
  member    = "user:iamboss@gmail.com"
}