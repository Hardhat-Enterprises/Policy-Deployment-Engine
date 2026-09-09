resource "google_bigquery_connection" "non_compliant_example_1" {
  connection_id = "non_compliant_example_1"
  location      = "aws-us-east-1"
  aws {
    access_role {
      iam_role_id = "arn:aws:iam::999999999999:role/untrusted-omnirole"
    }
  }
}
