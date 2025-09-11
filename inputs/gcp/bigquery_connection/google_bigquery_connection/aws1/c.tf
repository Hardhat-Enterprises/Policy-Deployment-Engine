resource "google_bigquery_connection" "c" {
  connection_id = "aws-conn-compliant"
  location      = "australia-southeast2"
  project       = "my-project-c"

  aws {
    access_role {
      iam_role_id = "arn:aws:iam::123456789012:role/bq-connection-prod"
    }
  }
}
