resource "google_developer_connect_git_repository_link" "nc" {
  project               = "pde2025"
  location              = "australia-southeast1"
  git_repository_link_id = "nc"
  parent_connection     = "my-connection"

  clone_uri = "https://github.com/test/testrepo.git"
}