resource "google_iam_access_boundary_policy" "c" {
  parent = "cloudresourcemanager.googleapis.com/projects/my-valid-project"
  name   = "c"

  rules {
    description = "Allow access to storage"
    access_boundary_rule {
      available_resource = "//storage.googleapis.com/projects/_/buckets/example-bucket"
      available_permissions = [
        "inRole:roles/storage.objectViewer"
      ]
    }
  }
}

