resource "google_logging_project_exclusion" "nc" {
  name            = "nc"  
  disabled        = true   
  filter          = "resource.type=gce_instance AND severity<ERROR" 
}