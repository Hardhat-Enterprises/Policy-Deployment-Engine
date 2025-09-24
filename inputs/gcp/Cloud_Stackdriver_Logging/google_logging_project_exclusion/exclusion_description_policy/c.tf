resource "google_logging_project_exclusion" "c" {

  name            = "c"  
 
    description = "Exclude health check logs from monitoring" 
    filter          = "resource.type=gce_instance AND severity<ERROR" 

}