package terraform.gcp.security.bigquery_connection.google_bigquery_connection.connection_id

import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_connection.google_bigquery_connection.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
  [
    {
      "situation_description": "BigQuery connection_id must not use disallowed names",
      "remedies": [
        "Do not use these exact IDs: cloud-resource-nc, test-connection"
      ]
    },
    {
      "condition": "connection_id must not match blacklisted values",
      "attribute_path": ["after", "connection_id"],
      "values": [
        "cloud-resource-nc",
        "test-connection"
      ],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
