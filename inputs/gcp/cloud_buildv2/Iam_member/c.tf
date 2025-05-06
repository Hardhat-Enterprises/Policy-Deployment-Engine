# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_cloudbuildv2_connection_iam_member" "c" {
  name      = "secure-connection-member"
  project    = "policy-deplo"
  location   = "global"
  //connection = "secure-connection"
  role       = "roles/viewer"
  member     = "user:iamboss@gmail.com"
}

