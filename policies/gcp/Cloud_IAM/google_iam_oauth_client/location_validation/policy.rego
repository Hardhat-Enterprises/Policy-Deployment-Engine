package terraform.gcp.security.Cloud_IAM.google_iam_oauth_client.location_validation
import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_oauth_client.location_validation.vars

conditions := [
  [
    {
      "situation_description": "OAuth client must only be deployed in global location",
      "remedies": ["Set location to global"]
    },
    {
      "condition": "Validate location",
      "attribute_path": ["location"],
      "values": ["global"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details