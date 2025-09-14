resource "google_logging_project_exclusion" "nc" {
  name        = "nc"  # Non-standard naming (required )
  filter      = "severity<ERROR"  # Overly broad filter 
}