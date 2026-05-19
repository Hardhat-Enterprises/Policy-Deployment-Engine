package terraform.gcp.security.cloud_spanner.google_spanner_database.deletion_protection

deny contains msg if {
  some r
  input.resource_changes[r].type == "google_spanner_database"
  not input.resource_changes[r].change.after.deletion_protection
  msg := "Cloud Spanner database must have deletion_protection set to true"
}
