resource "google_bigquery_connection" "compliant_example_1" {
  connection_id = "compliant_example_1"
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
