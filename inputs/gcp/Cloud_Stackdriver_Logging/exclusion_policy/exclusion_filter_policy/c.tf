resource "google_logging_project_exclusion" "c" {

  name            = "c"  # Standard naming (required)
  filter          = "resource.type=gce_instance AND severity<ERROR" #policy to be tested 

}