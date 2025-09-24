resource "google_logging_project_exclusion" "c" {

  name            = "c"  
  filter          = "resource.type=gce_instance AND severity<ERROR" 

}