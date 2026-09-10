resource "google_firestore_database" "non_compliant_example_1" {
  project                           = "c"
  name                              = "non_compliant_example_1"
  location_id                       = "nam5"
  type                              = "FIRESTORE_NATIVE"
  app_engine_integration_mode       = "DISABLED"
  point_in_time_recovery_enablement = "POINT_IN_TIME_RECOVERY_ENABLED"
  delete_protection_state           = "DELETE_PROTECTION_ENABLED"
  deletion_policy                   = "DELETE"
}
