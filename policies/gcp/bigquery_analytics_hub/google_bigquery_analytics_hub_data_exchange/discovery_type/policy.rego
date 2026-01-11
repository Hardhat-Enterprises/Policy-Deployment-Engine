package terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_data_exchange.discovery_type

import data.terraform.helpers
import data.terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_data_exchange.vars

approved_discovery_types := {"DISCOVERY_TYPE_PRIVATE"}

resource_type := vars.variables.resource_type
friendly_name := vars.variables.friendly_resource_name

resources := [r |
  r := input.planned_values.root_module.resources[_]
  r.type == resource_type
]

non_compliant := [item |
  r := resources[_]
  dt := r.values.discovery_type
  not approved_discovery_types[dt]

  item := {
    "id": r.name,                # MUST be "c" or "nc"
    "discovery_type": dt,
  }
]

non_compliant_ids := [x.id | x := non_compliant[_]]

# Rego conditional formatting
nc_display := "None - All passed" if {
  count(non_compliant_ids) == 0
}

nc_display := sprintf("%v", [non_compliant_ids]) if {
  count(non_compliant_ids) > 0
}

message := [
  sprintf("Total %s detected: %d ", [friendly_name, count(resources)]),
  [
    "Situation 1: The BigQuery Analytics Hub data exchange has a non-approved discovery type.",
    sprintf("Non-Compliant Resources: %s", [nc_display]),
  ],
]

details := [
  {
    "situation": "The BigQuery Analytics Hub data exchange has a non-approved discovery type.",
    "remedies": [
      "Set 'discovery_type' to an approved value such as 'DISCOVERY_TYPE_PRIVATE'.",
    ],
    "non_compliant_resources": non_compliant_ids,
    "conditions": [
      {
        "discovery_type must be one of the approved values.": non_compliant,
      },
    ],
  },
]

summary := {
  "message": message,
  "details": details,
}
