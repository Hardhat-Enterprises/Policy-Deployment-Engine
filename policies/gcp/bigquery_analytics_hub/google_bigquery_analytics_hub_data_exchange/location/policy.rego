package terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_data_exchange.location

import data.terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_data_exchange.vars
import data.terraform.helpers

allowed_locations := {"australia-southeast1"}

resource_type := vars.variables.resource_type
friendly_name := vars.variables.friendly_resource_name

resources := [r |
  r := input.planned_values.root_module.resources[_]
  r.type == resource_type
]

non_compliant := [item |
  r := resources[_]
  loc := r.values.location
  not allowed_locations[loc]

  item := {
    "id": r.name,        # must be nc/c names
    "location": loc,
  }
]

non_compliant_ids := [x.id | x := non_compliant[_]]

nc_display := "None - All passed" if { count(non_compliant_ids) == 0 }
nc_display := sprintf("%v", [non_compliant_ids]) if { count(non_compliant_ids) > 0 }

message := [
  sprintf("Total %s detected: %d ", [friendly_name, count(resources)]),
  [
    "Situation 1: The BigQuery Analytics Hub data exchange is created in a non-approved region.",
    sprintf("Non-Compliant Resources: %s", [nc_display]),
  ],
]

details := [
  {
    "situation": "The BigQuery Analytics Hub data exchange is created in a non-approved region.",
    "remedies": [
      "Set 'location' to an approved region such as 'australia-southeast1'.",
    ],
    "non_compliant_resources": non_compliant_ids,
    "conditions": [
      {
        "Location must be one of the approved regions.": non_compliant,
      },
    ],
  },
]

summary := {
  "message": message,
  "details": details,
}
