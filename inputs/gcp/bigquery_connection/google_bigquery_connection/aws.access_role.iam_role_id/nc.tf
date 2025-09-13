resource "google_bigquery_connection" "nc" {
  connection_id = "aws-conn-noncompliant"
  location      = "australia-southeast2"
  project       = "my-project-nc"

  aws {
    
    access_role {
      iam_role_id = "arn:aws:iam::999999999999:role/other-role"
    }
  }
}
