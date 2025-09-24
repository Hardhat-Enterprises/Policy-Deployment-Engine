resource "google_logging_project_exclusion" "nc" {
  name        = "nc"  
  filter      = "severity<ERROR"  
}