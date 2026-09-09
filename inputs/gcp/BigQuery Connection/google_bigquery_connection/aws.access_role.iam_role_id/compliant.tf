resource "google_bigquery_connection" "compliant_example_1" {
  connection_id = "compliant_example_1"
  location      = "aws-us-east-1"
  aws {
    access_role {
      iam_role_id = "arn:aws:iam::111111111111:role/approved-role"
    }
  }
}
