resource "google_iam_access_boundary_policy" "nc1" {
  parent = "invalid-parent-format"

  name   = "nc1" 

  display_name = "Invalid Access Boundary Policy"

  rules {
    access_boundary_rule {
      available_resource    = "//storage.googleapis.com/projects/_/buckets/my-bucket"
      available_permissions = ["inRole:roles/storage.objectViewer"]
    }
  }
}