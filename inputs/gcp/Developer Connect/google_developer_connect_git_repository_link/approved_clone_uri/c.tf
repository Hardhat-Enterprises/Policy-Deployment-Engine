resource "google_developer_connect_git_repository_link" "c" {
  project               = "pde2025"
  location              = "australia-southeast1"
  git_repository_link_id = "c"
  parent_connection     = "my-connection"

  clone_uri = "https://github.com/myorg/myrepo.git"
}