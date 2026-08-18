resource "google_bigquery_job" "non_compliant_example_1" {
  job_id = "non_compliant_example_1"
  project = "PDE"
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
