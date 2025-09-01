resource "google_bigquery_connection" "c" {
  project       = "my-project c"
  location      = "australia-southeast1"
  connection_id = "bq-conn-aws-c"

  aws {
    access_role {
      iam_role_id = "arn:aws:iam::123456789012:role/approved-role-1"
    }
  }
}
