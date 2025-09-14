resource "google_logging_project_sink" "nc" {
  name        = "nc"  # Non-standard naming
  project     = "gdce-dev"
  destination = "bigquery.googleapis.com/projects/gdce-dev/datasets/unapproved_dataset"  # Non-approved dataset
  filter      = "severity<ERROR"  # Overly broad filter
  description = ""  # Missing description

  unique_writer_identity = true
}