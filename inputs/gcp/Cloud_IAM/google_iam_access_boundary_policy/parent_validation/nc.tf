resource "google_iam_access_boundary_policy" "nc" {
  parent = "invalid-parent-format"

  name   = "pde-my-ab-policy" 

  display_name = "Invalid Access Boundary Policy"

  rules {
    access_boundary_rule {
      available_resource    = "//storage.googleapis.com/projects/_/buckets/my-bucket"
      available_permissions = ["inRole:roles/storage.objectViewer"]
    }
  }
}