resource "google_bigquery_job" "nc" {
  job_id = "nc"
  project = "your-gcp-project-id"
  location = "global"
  load {
    source_uris = [""]  
    
    destination_table {
      dataset_id = "your_dataset"
      table_id   = "your_table"
    }
    
    max_bad_records = null
    
  }
}