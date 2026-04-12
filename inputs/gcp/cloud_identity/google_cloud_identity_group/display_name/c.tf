resource "google_cloud_identity_group" "good" {
  display_name = "my-secure-group"
  parent       = "customers/C123abc"

  group_key {
    id = "group@example.com"
  }

  labels = {
    "cloudidentity.googleapis.com/groups.discussion_forum" = ""
  }
}