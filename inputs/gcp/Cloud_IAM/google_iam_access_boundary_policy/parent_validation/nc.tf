resource "google_iam_access_boundary_policy" "nc" {
  parent = "projects/my-valid-project"   
  name   = "nc-policy-1"

  rules {
    description = "NC rule"
    access_boundary_rule {
      available_resource    = "//storage.googleapis.com/projects/_/buckets/nc-bucket"
      available_permissions = ["inRole:roles/storage.objectViewer"]
    }
  }
}