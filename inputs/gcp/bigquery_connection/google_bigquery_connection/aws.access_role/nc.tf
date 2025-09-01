resource "google_bigquery_connection" "nc" {
  project       = "my-project nc"
  location      = "australia-southeast1"
  connection_id = "bq-conn-aws-nc"

  aws {
    access_role {
      iam_role_id = "arn:aws:iam::999999999999:role/unapproved-role"
    }
  }
}
