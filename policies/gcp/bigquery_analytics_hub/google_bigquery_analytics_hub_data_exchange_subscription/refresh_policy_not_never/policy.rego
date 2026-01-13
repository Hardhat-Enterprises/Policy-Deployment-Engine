package terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_data_exchange_subscription.refresh_policy_not_never

import data.terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_data_exchange_subscription.vars

resource_type := vars.variables.resource_type
friendly_name := vars.variables.friendly_resource_name

resources := [r |
  r := input.planned_values.root_module.resources[_]
  r.type == resource_type
]

non_compliant := [item |
  r := resources[_]
  rp := r.values.refresh_policy
  rp == "NEVER"

  item := {
    "id": r.name,
    "refresh_policy": rp,
  }
]

non_compliant_ids := [x.id | x := non_compliant[_]]

nc_display := "None - All passed" if { count(non_compliant_ids) == 0 }
nc_display := sprintf("%v", [non_compliant_ids]) if { count(non_compliant_ids) > 0 }

message := [
  sprintf("Total %s detected: %d ", [friendly_name, count(resources)]),
  [
    "Situation 1: refresh_policy must not be NEVER.",
    sprintf("Non-Compliant Resources: %s", [nc_display]),
  ],
]

details := [
  {
    "situation": "refresh_policy must not be NEVER.",
    "remedies": [
      "Set refresh_policy to ON_READ or ON_STALE.",
    ],
    "non_compliant_resources": non_compliant_ids,
    "conditions": [
      {
        "refresh_policy cannot be NEVER.": non_compliant,
      },
    ],
  },
]

summary := {
  "message": message,
  "details": details,
}
