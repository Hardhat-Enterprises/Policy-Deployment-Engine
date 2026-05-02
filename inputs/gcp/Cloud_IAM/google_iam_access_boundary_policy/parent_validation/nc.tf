resource "google_iam_access_boundary_policy" "nc" {
  parent = "invalid-parent-format"

  name   = "allmost" 

  display_name = "safsdd"

  rules {
    access_boundary_rule {
      available_resource    = "//storagsde.googleapis.com/projects/_/buckets/my-bucket"
      available_permissions = ["inRole:rsdaoles/storage.objectViewer"]
    }
  }
}