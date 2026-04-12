resource "google_cloud_identity_group" "nc" {
  display_name = "nc"
  parent       = "customers/C123abc"

  group_key {
    id = "group@example.com"
  }

  labels = {
    "cloudidentity.googleapis.com/groups.discussion_forum" = ""
  }
}