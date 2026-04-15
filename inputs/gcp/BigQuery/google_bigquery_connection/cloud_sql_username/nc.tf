resource "google_bigquery_connection" "nc" {
  connection_id = "nc"
  project       = "PDE"
  location      = "australia-southeast1"

  cloud_sql {
    instance_id = "project:region:instance"
    database    = "mydatabase"
    type        = "POSTGRES"
    credential {
      username = ""
      password = "securepassword123"
    }
  }

  kms_key_name = "google_kms_crypto_key.crypto_key.id"
}
