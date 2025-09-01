
resource "google_spanner_database" "nc" {
  project  = "my-spanner-project-nc"
  instance = "spanner-inst-nc"
  name     = "db"
  
}
