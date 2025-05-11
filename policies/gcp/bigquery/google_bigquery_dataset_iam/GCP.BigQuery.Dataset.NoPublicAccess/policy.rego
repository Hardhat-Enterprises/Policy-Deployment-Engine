package terraform.gcp.security.bigquery.google_bigquery_dataset_iam_member.no_public_access

import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery.google_bigquery_dataset_iam_member.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE
# Done below in vars.rego

# STEP 2: CREATE SCENARIOS 
conditions := [
  [
    {
      "situation_description": "BigQuery dataset IAM member grants public access to 'allUsers' or 'allAuthenticatedUsers'",
      "remedies": [
        "Remove 'allUsers' or 'allAuthenticatedUsers' as a member from the IAM binding.",
        "Restrict access to specific identities or groups."
      ]
    },
    {
      "condition": "Check if IAM member is set to 'allUsers' or 'allAuthenticatedUsers'",
      "attribute_path": ["member"],
      "values": ["allUsers", "allAuthenticatedUsers"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
