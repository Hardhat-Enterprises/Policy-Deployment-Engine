package terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_listing_subscription

import data.terraform.helpers

default message := []

resource_type := "google_bigquery_analytics_hub_listing_subscription"

# Return the destination_dataset object safely
dest_dataset(after) := d if {
  after.destination_dataset
  count(after.destination_dataset) > 0
  d := after.destination_dataset[0]
}

# environment label value ("" if missing / null)
env_value(d) := v if {
  d.labels != null
  v := object.get(d.labels, "environment", "")
}

env_value(d) := "" if {
  d.labels == null
}

noncompliant_resources contains name if {
  rc := input.resource_changes[_]
  rc.type == resource_type
  after := rc.change.after
  d := dest_dataset(after)

  env := env_value(d)
  env == ""

  name := rc.name
}

message := [
  "Situation 1: destination_dataset.labels.environment is required for BigQuery Analytics Hub Listing Subscription.",
  sprintf("Non-Compliant Resources: %v", [[n | n := noncompliant_resources[_]]]),
] if {
  count(noncompliant_resources) > 0
}
