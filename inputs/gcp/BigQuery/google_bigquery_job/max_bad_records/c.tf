resource "google_bigquery_job" "c" {
  job_id   = "c"
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