resource "google_logging_project_exclusion" "c" {
  name        = "c"  
 disabled        = false  
  
  filter      = "resource.type=gce_instance AND protoPayload.methodName=\"health.check\""
}