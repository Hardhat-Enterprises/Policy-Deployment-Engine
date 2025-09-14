resource "google_logging_project_exclusion" "c" {

  name            = "c"  # Standard naming (required)
 
    description = "Exclude health check logs from monitoring" #policy to be tested 
    filter          = "resource.type=gce_instance AND severity<ERROR" #required 

}