resource "google_bigquery_job" "c" {
  job_id   = "c"
  project  = "PDE"
  location = "australia-southeast1"

  query {
    query = "SELECT 1"

    maximum_bytes_billed = 1000000000 //1 gb
  }
}