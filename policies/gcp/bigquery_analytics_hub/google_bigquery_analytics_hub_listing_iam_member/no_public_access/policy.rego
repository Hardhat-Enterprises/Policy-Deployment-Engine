package terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_listing_iam_member

import rego.v1

# Collect all resources of this type from the Terraform plan JSON
resources := [rc |
  rc := input.resource_changes[_]
  rc.type == "google_bigquery_analytics_hub_listing_iam_member"
  rc.change.after != null
]

# Public members are not allowed
is_public_member(member) if lower(member) == "allusers"
is_public_member(member) if lower(member) == "allauthenticatedusers"

# List of noncompliant resource names (e.g., ["nc"])
noncompliant := [rc.name |
  rc := resources[_]
  is_public_member(rc.change.after.member)
]

# Message output (only emit when there is at least one violation)
message := [
  "Situation 1: Public access is not allowed on BigQuery Analytics Hub Listing IAM Member.",
  sprintf("Non-Compliant Resources: %v", [noncompliant]),
] if {
  count(resources) > 0
  count(noncompliant) > 0
}

# If there are resources but none are noncompliant, emit nothing
message := [] if {
  count(resources) > 0
  count(noncompliant) == 0
}
