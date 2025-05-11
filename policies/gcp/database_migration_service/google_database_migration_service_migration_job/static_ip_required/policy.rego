package terraform.gcp.security.dms.migration_job.static_ip_required

default message := ["All passed"]
default details := []

non_compliant_resources := [r.name | 
  r := input.planned_values.root_module.resources[_]
  r.type == "google_database_migration_service_migration_job"
  not r.values.static_ip_connectivity
]

message := [
  sprintf("Total DMS Migration Job detected: %v", [count(input.planned_values.root_module.resources)]),
  "Situation 1: Migration job is missing static_ip_connectivity block.",
  sprintf("Non-Compliant Resources: %v", [non_compliant_resources]),
  "Potential Remedies: Add an empty static_ip_connectivity {} block to allow source DB to accept incoming connections from Cloud SQL."
]

details := [sprintf("Resource '%v' is missing static_ip_connectivity.", [r]) | r := non_compliant_resources]
