resource "google_logging_project_exclusion" "c" {
  name        = "c"  # Standard naming (required)
 disabled        = false  # Enabled (not disabled) (policy to be tested)
  
  filter      = "resource.type=gce_instance AND protoPayload.methodName=\"health.check\""
}