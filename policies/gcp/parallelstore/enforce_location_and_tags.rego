package terraform.gcp.parallelstore.enforce_location_and_tags

import data.terraform.gcp.helpers

__rego_metadata__ := {
  "id": "GCP_PARALLELSTORE_ENFORCE_LOCATION_AND_TAGS",
  "title": "Ensure Parallelstore resources are in correct location and have tags",
  "description": "This policy ensures that GCP Parallelstore resources are only deployed in approved locations and contain mandatory tags.",
  "severity": "medium",
  "type": helpers.get_policy_type("whitelist")
}

__rego_input__ := {
  "resource_type": "google_parallelstore_instance",
  "allowed_locations": ["australia-southeast1", "us-central1"],
  "required_tags": ["env", "owner"]
}

deny[msg] {
  resource := helpers.get_all_resources(__rego_input__.resource_type)[_]

  # Location check
  not helpers.array_contains(__rego_input__.allowed_locations, resource.values.location)
  msg := sprintf("Parallelstore resource %s is in disallowed location %s", [resource.address, resource.values.location])
}

deny[msg] {
  resource := helpers.get_all_resources(__rego_input__.resource_type)[_]
  tag := __rego_input__.required_tags[_]

  # Tag check
  not resource.values.labels[tag]
  msg := sprintf("Parallelstore resource %s is missing required tag: %s", [resource.address, tag])
}
