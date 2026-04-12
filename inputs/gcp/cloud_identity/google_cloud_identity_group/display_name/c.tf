resource "google_cloud_identity_group" "c" {
  display_name = "c"
  parent       = "customers/C123abc"

  group_key {
    id = "group@example.com"
  }

  labels = {
    "cloudidentity.googleapis.com/groups.discussion_forum" = ""
  }
}