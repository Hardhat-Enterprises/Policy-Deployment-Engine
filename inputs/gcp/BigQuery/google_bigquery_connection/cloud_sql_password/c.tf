resource "google_bigquery_connection" "c" {
  connection_id = "c"
  project       = "PDE"
  location      = "australia-southeast1"
  cloud_sql {
    instance_id = "project:region:instance"
    database    = "mydatabase"
    type        = "POSTGRES"
    credential {
      username = "bq_app_user"
      password = "Str0ng-P4ssw0rd-2026"
    }
  }
  kms_key_name = "google_kms_crypto_key.crypto_key.id"
}