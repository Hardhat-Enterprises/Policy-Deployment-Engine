package appengine.policy

deny[msg] if {
  some i
  resource := input.resource_changes[i]
  resource.type == "google_app_engine_application"
  region := resource.change.after.location_id
  region != "us-central"
  msg := sprintf("App Engine region '%s' is not allowed. Only 'us-central' is permitted.", [region])
}