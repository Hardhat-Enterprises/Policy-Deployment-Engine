package terraform.gcp.security.developer_connect.google_developer_connect_connection.approved_location
import data.terraform.gcp.helpers
import data.terraform.gcp.security.developer_connect.google_developer_connect_connection.vars

conditions := [
  [
    {
      "situation_description": "Location must be within approved Australian regions",
      "remedies": ["Set location to australia-southeast1 or australia-southeast2"]
    },
    {
      "condition": "Location not in approved regions",
      "attribute_path": ["location"],
      "values": ["australia-southeast1","australia-southeast2"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details