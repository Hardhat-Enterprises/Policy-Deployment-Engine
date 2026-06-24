resource "google_bigquery_connection" "c" {
  connection_id = "c"
  project       = "PDE"
  location      = "australia-southeast1"

  cloud_sql {
    instance_id = "project:region:instance"
    database    = "mydatabase"
    type        = "POSTGRES"
    credential {
      username = "admin"
      password = "securepassword123"
    }
  }

  kms_key_name = "google_kms_crypto_key.crypto_key.id"
}
