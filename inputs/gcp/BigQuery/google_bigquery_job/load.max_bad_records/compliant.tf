resource "google_bigquery_job" "compliant_example_1" {
  job_id   = "compliant_example_1"
  project  = "PDE"
  location = "australia-southeast1"

  load {
    source_uris = [""]  
    
    destination_table {
      dataset_id = "your_dataset"
      table_id   = "your_table"
    }
    
    max_bad_records = 10
    
  }
}
