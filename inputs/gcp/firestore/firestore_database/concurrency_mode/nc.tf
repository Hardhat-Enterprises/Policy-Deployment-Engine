resource "google_firestore_database" "nc" {
  project                           = "abcd_1234"
  name                              = "c"
  location_id                       = "nam5"
  type                              = "FIRESTORE_NATIVE"
  //concurrency_mode                  = "OPTIMISTIC"
  app_engine_integration_mode       = "DISABLED"
  point_in_time_recovery_enablement = "POINT_IN_TIME_RECOVERY_ENABLED"
  delete_protection_state           = "DELETE_PROTECTION_ENABLED"
  deletion_policy                   = "DELETE"
}