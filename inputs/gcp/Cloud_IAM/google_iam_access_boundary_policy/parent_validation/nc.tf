resource "google_iam_access_boundary_policy" "nc" {
  parent       = ""
  name         = "restricted-ab-policy"
  display_name = "Restricted Access Boundary Policy"

  rules {
    access_boundary_rule {
      available_resource    = "//storage.googleapis.com/projects/_/buckets/my-bucket"
      available_permissions = ["inRole:roles/storage.objectViewer"]
    }
  }
}