resource "google_logging_project_sink" "nc" {
  name        = "nc"  
  project     = "gdce-dev"
  destination = "bigquery.googleapis.com/projects/gdce-dev/datasets/unapproved_dataset"  
  filter      = "severity<ERROR"  
  description = ""  

  unique_writer_identity = true
}