
resource "google_spanner_database" "c" {
  project  = "my-spanner-project-c"
  instance = "spanner-inst-c"
  name     = "appdb"
  
  encryption_config {
    kms_key_name = "projects/my-kms-proj/locations/australia-southeast1/keyRings/app-ring/cryptoKeys/app-key"
  }
}
