package terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_data_exchange_iam_member.public_access

import data.terraform.gcp.security.bigquery_analytics_hub.google_bigquery_analytics_hub_data_exchange_iam_member.vars

resource_type := vars.variables.resource_type
friendly_name := vars.variables.friendly_resource_name

resources := [r |
  r := input.planned_values.root_module.resources[_]
  r.type == resource_type
]

bad_members := {"allUsers", "allAuthenticatedUsers"}

non_compliant := [item |
  r := resources[_]
  bad_members[r.values.member]

  item := {
    "id": r.name,
    "member": r.values.member,
  }
]

non_compliant_ids := [x.id | x := non_compliant[_]]

nc_display := "None - All passed" if { count(non_compliant_ids) == 0 }
nc_display := sprintf("%v", [non_compliant_ids]) if { count(non_compliant_ids) > 0 }

message := [
  sprintf("Total %s detected: %d ", [friendly_name, count(resources)]),
  [
    "Situation 1: Public access is not allowed on BigQuery Analytics Hub Data Exchange IAM.",
    sprintf("Non-Compliant Resources: %s", [nc_display]),
  ],
]

details := [
  {
    "situation": "Public access is not allowed on BigQuery Analytics Hub Data Exchange IAM.",
    "remedies": [
      "Remove public members such as 'allUsers' and 'allAuthenticatedUsers'.",
      "Use specific identities like 'user:', 'group:', or 'serviceAccount:'.",
    ],
    "non_compliant_resources": non_compliant_ids,
    "conditions": [
      {
        "Member must not be allUsers or allAuthenticatedUsers.": non_compliant,
      },
    ],
  },
]

summary := {
  "message": message,
  "details": details,
}
