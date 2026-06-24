resource "google_developer_connect_git_repository_link" "nc" {
  project                 = "pde2025"
  location                = "us-central1"
  git_repository_link_id  = "nc"
  parent_connection       = "google_developer_connect_connection.my-connection.connection_id"
  clone_uri               = "https://github.com/myuser/myrepo.git"
}