package terraform.gcp.security.bigquery.google_bigquery_dataset_access.RestrictApprovedRoles

import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery.google_bigquery_dataset_access.vars

conditions := [
  [
    {
      "situation_description": "A non-approved IAM role is assigned to BigQuery Dataset Access.",
      "remedies": [
        "Replace the role with one of the approved roles: roles/bigquery.dataViewer, roles/bigquery.dataEditor, roles/bigquery.metadataViewer"
      ]
    },
    {
      "condition": "Test if the IAM role is part of the approved whitelist.",
      "attribute_path": ["role"],
      "values": [
        "roles/bigquery.dataViewer",
        "roles/bigquery.dataEditor",
        "roles/bigquery.metadataViewer"
      ],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
