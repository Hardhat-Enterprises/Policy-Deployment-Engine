package terraform.gcp.security.cloud_spanner.google_spanner_database.enable_drop_protection

deny contains msg if {
  some r
  input.resource_changes[r].type == "google_spanner_database"
  not input.resource_changes[r].change.after.enable_drop_protection
  msg := "Cloud Spanner database must have enable_drop_protection set to true"
}
