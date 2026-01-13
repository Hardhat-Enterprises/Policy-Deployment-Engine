package terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_listing

import rego.v1

policy_name := "restricted_export_enabled"
resource_type := "google_bigquery_analytics_hub_listing"

resources := [r |
  r := input.resource_changes[_]
  r.type == resource_type
]

# TRUE if restricted_export_config exists and enabled == true (Terraform JSON block-list form)
restricted_export_enabled(after) if {
  some i
  after.restricted_export_config[i].enabled == true
}

non_compliant := [name |
  r := resources[_]
  after := r.change.after
  name := r.name

  not restricted_export_enabled(after)
]

message := msg if {
  count(resources) > 0
  count(non_compliant) > 0
  msg := [
    "Situation 1: restricted_export_config.enabled must be true for BigQuery Analytics Hub Listing.",
    sprintf("Non-Compliant Resources: %v", [non_compliant]),
  ]
}

message := msg if {
  count(resources) > 0
  count(non_compliant) == 0
  msg := ["All BigQuery Analytics Hub Listings have restricted export enabled."]
}
