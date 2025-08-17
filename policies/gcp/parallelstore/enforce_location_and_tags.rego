package gcp.parallelstore.enforce_location_and_tags

deny[msg] {
  input.resource.type == "parallelstore.googleapis.com/Instance"
  not input.resource.labels["project_id"]
  msg := "Parallelstore instance must include a project_id label"
}

deny[msg] {
  input.resource.type == "parallelstore.googleapis.com/Instance"
  input.resource.location != "australia-southeast1"
  msg := sprintf("Parallelstore instances must be deployed in australia-southeast1, found: %v", [input.resource.location])
}
