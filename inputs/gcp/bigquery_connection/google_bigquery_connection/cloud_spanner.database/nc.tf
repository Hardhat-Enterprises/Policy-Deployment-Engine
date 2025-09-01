# Keep "nc" as the name to indicate non-compliant
resource "google_spanner_database" "nc" {
  project  = "my-spanner-project-nc"
  instance = "spanner-inst-nc"
  name     = "db"
  # encryption_config omitted → defaults to Google-managed keys (not CMEK)
}
