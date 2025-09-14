resource "google_logging_project_exclusion" "nc" {
  name            = "nc"  # Non-standard naming (required )
  disabled        = true  # Disabled (security risk) #Policy to be tested 
  filter          = "resource.type=gce_instance AND severity<ERROR" #required 
}