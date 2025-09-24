resource "google_logging_project_exclusion" "nc" {
  name        = "nc"  
  description = "Custom exclusion rule"
  
  filter      = "severity<ERROR"  
}