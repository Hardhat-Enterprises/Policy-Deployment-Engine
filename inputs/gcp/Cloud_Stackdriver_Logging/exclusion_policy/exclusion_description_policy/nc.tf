resource "google_logging_project_exclusion" "nc" {
  name        = "nc"  # Non-standard naming (required )
  description = "Custom exclusion rule"
  
  filter      = "severity<ERROR"  # Overly broad filter
}