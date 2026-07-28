resource "google_bigquery_job" "compliant_example_1" {
  job_id = "compliant_example_1"
  project = "PDE"
  location =  "australia-southeast1"

  query {
    query = "SELECT 1"
      
    maximum_bytes_billed = 1000000000 //1 gb
  }
}
