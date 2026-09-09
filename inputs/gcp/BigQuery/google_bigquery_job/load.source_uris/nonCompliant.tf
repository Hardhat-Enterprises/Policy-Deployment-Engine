resource "google_bigquery_job" "non_compliant_example_1" {
  job_id = "non_compliant_example_1"
  project = "PDE"
  location = "australia-southeast1"
  load {
    source_uris = ["invalid_uri"]  
    
    destination_table {
      dataset_id = "your_dataset"
      table_id   = "your_table"
    }
    
  }
}
