resource "google_iam_access_boundary_policy" "nc" {
  parent = urlencode("cloudresourcemanager.googleapis.com/projects/my-project")
  name = ""

  rules {
    access_boundary_rule {
      available_resource    = "//storage.googleapis.com/projects/_/buckets/my-bucket"
      available_permissions = ["inRole:roles/storage.objectViewer"]
    }
  }
}