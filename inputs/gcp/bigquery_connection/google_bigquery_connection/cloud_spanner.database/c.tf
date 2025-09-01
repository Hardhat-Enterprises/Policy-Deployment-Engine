# Keep "c" as the name to indicate compliant
resource "google_spanner_database" "c" {
  project  = "my-spanner-project-c"
  instance = "spanner-inst-c"
  name     = "appdb"
  # Optional: database_dialect = "GOOGLE_STANDARD_SQL"

  encryption_config {
    kms_key_name = "projects/my-kms-proj/locations/australia-southeast1/keyRings/app-ring/cryptoKeys/app-key"
  }
}
