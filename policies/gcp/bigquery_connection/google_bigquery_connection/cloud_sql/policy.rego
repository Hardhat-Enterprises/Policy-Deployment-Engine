
package terraform.gcp.security.bigquery_connection.google_bigquery_connection.cloud_sql

import data.terraform.gcp.helpers
import data.terraform.gcp.security.bigquery_connection.google_bigquery_connection.vars

conditions := [[
  {
    "situation_description": "Require BigQuery Cloud SQL connections to be in approved AU regions",
    "remedies": [
      "Set connection.location to australia-southeast1 or australia-southeast2",
      "Ensure the Cloud SQL instance is deployed in a matching AU region"
    ]
  },
  {
    "condition": "location must be in approved regions",
    "attribute_path": ["location"],
    "policy_type": "whitelist",
    "values": [
      "australia-southeast1",
      "australia-southeast2"
    ]
  }
]]


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
